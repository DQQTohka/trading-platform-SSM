package com.dmu.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.dmu.pojo.Product;
import com.dmu.pojo.User;
import com.dmu.service.ProductService;

@Controller
public class ProductController {
	@Resource
	private ProductService productServiceImpl;
	/**
	 * 显示所有商品
	 * @param sort 商品类别，0表示全部商品
	 * @param req
	 * @return
	 */
	@RequestMapping("showproduct")
	public String ShowProduct(HttpServletRequest req, int sort, HttpSession session) {
		List<Product> list = null;
		session.setAttribute("sort", sort);
		if(sort==0) {
			list = productServiceImpl.selAllProductShow();
		}else {
			list = productServiceImpl.selSortProduct(sort);
		}
		if(list!=null) {
			req.setAttribute("products", list);
			return "show.jsp";
		}else {
			return "error.jsp";
		}
		
	}
	/**
	 * 发布商品控制器
	 * @return
	 */
	@RequestMapping("publish")
	public String PublishProduct() {
		return "publish.jsp";
	}
	
	/**
	 * 发布商品，需要用户登录才能发布
	 * 通过MultipartFile，上传照片到images/product目录下，同时保存文件名到数据库
	 * @param product
	 * @param session
	 * @return
	 */
	@RequestMapping("published")
	public String PublishedProduct(Product product, HttpSession session, MultipartFile file, HttpServletRequest req) {
		String fileName = UUID.randomUUID().toString()+file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		//测试路径,部署到其他电脑的时候要修改
		String path = "D:\\eclipse\\eclipse-workspace\\zzy\\WebContent\\images\\product\\"+fileName;
		//String path = req.getServletContext().getRealPath("images/test")+"\\"+fileName;
		System.out.println("路径"+path);
		try {
			FileUtils.copyInputStreamToFile(file.getInputStream(), new File(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
		User user = (User) session.getAttribute("user");
		product.setUid(user.getId());
		product.setImage(fileName);
		int index = productServiceImpl.insPublishProduct(product);
		if(index>0) {
			return "showproduct?sort=0";
		}else {
			return "error.jsp";
		}
	}
	/**
	 * 查看登录用户发布了的商品
	 */
	@RequestMapping("userproduct")
	public String UserProduct(HttpSession session, HttpServletRequest req) {
		User user = (User) session.getAttribute("user");
		List<Product> userDisplayProducts = productServiceImpl.selUserProduct(user.getId());
		if(userDisplayProducts!=null) {
			req.setAttribute("userDisplayProducts", userDisplayProducts);
			return "my_product.jsp";
		}else {
			return "error.jsp";
		}
	}
	
	/**
	 * 根据商品id查看详细
	 * @param req
	 * @param id	商品id
	 * @return
	 */
	@RequestMapping("productinfo")
	public String ProductInfo(HttpServletRequest req, int id) {
		Product productInfo = productServiceImpl.selProductInfo(id);
		req.setAttribute("productInfo", productInfo);
		//return "product_info.jsp";
		return "good.jsp";
	}
	/**
	 * 购买商品，把商品设置成下架后,然后更新用户余额(转发到用户控制器的映射路径：updUserBalance)
	 * @param id 商品id
	 * @param price 商品价格 price是double类型的，然后用int接收会出现400错误
	 * @param uid 卖家用户id
	 * @return
	 */
	@RequestMapping("buy")
	public String BuyProduct(int id,int uid,double price) {
		int index = productServiceImpl.updBuy(id);
		if(index>0) {
			return "updUserBalance";
		}else {
			return "error.jsp";
		}
	}
	
	/**
	 * 对上架的商品排序
	 * @param sort 商品分类，这个sort是通过session保存传递的
	 * @param flag 判断升序还是降序，按照时间还是价格,1是价格升序，2为价格降序，3为日期降序
	 * @param req
	 * @return
	 */
	@RequestMapping("sortingproduct")
	public String ProductPublishDesc(int sort, int flag, HttpServletRequest req) {
		List<Product> products = null;
		System.out.println(sort);
		if(flag == 1) {
			products = productServiceImpl.selSortPriceAsc(sort);
		}else if(flag == 2) {
			products = productServiceImpl.selSortPriceDesc(sort);
		}else if(flag == 3) {
			products = productServiceImpl.selSortDayDesc(sort);
		}
		if(products!=null) {
			req.setAttribute("products", products);
			return "show.jsp";
		}else {
			return "error.jsp";
		}
	}
	
	/**
	 * 根据商品名称查询商品
	 * @param name
	 * @param req
	 * @return
	 */
	@RequestMapping("search")
	public String Search(String name, HttpServletRequest req) {
		System.out.println(name);
		List<Product> products = productServiceImpl.selSearchProduct(name);
		req.setAttribute("products", products);
		return "show.jsp";
	}
	
	/**
	 * 是否支付,点击支付后跳转到支付页面，并没有真正购买
	 * @param id 商品id
	 * @return
	 */
	@RequestMapping("pay")
	public String Pay(int id, HttpServletRequest req) {
		Product productInfo = productServiceImpl.selProductInfo(id);
		req.setAttribute("productInfo", productInfo);
		return "pay.jsp";
	}
	
	/**
	 * 删除商品
	 * @param id 商品id
	 * @return
	 */
	@RequestMapping("delProduct")
	public String delProduct(int id) {
		int index = productServiceImpl.delProductById(id);
		if(index > 0) {
			return "userproduct";
		}else {
			return "error.jsp";
		}
	}
	
}
