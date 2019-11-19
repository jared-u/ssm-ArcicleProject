package cn.jared.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.jared.pojo.Article;
import cn.jared.pojo.Reply;
import cn.jared.pojo.Words;
import cn.jared.service.ArticleService;

@Controller
@RequestMapping("/article")
public class ArticleController {
	/**
	 * 	声明一个变量用于区别我访问的是文章管理页面，还是回收站页面
     * 0：访问的是文章管理页面     1：表示访问的是回收站页面
     */
	private int goId=0;
	@Autowired
	private ArticleService articleService;
	
	/**
	 * 	跳转文章编辑页面
	 * */
	@RequestMapping("/toArticleWrite")
	public String toArticleWrite() {
		return "view/article/articleWrite";
	}
	
	/**
	 * 	跳转到文章管理页面
     */
    @RequestMapping(value = "/toArticleManage")
    public String toArticleManage() {
        //设置我区别访问页面的状态码
        goId = 0;
        return "redirect:findByPage";
    }
    
    /**
     *	 跳转到回收站页面
     */
    @RequestMapping(value = "/toArticleTrash")
    public String toArticleTrash() {
        //设置这个状态码为1表示我访问的是回收站页面
        goId = 1;
        return "redirect:findByPage";
    }
    
    @RequestMapping("/findByPage")
    public String findByPage(@RequestParam(value="pageCode",defaultValue="1",required=false)int pageCode,
    						@RequestParam(value="pageSize",defaultValue="3",required=false)int pageSize,
    						HttpServletRequest request,Model model) {
    	String verify = request.getParameter("r_verify");
        String publish = request.getParameter("r_publish");
        String status = request.getParameter("r_status");
        int r_verify = 0, r_publish = 0, r_status = 0;
        if (verify != null) {
            if (verify.equals("已审核")) {
                r_verify = 1;
            } else if (verify.equals("未审核")) {
                r_verify = 0;
            }
        }
        if (publish != null) {
            if (publish.equals("已发布")) {
                r_publish = 1;
            } else if (verify.equals("未发布")) {
                r_publish = 0;
            }
        }
        if (status != null) {
            if (status.equals("存在")) {
                r_status = 0;
            } else if (status.equals("已删除")) {
                r_status = 1;
            }
        }
        Map<String, Object> conMap = new HashMap<String, Object>();
        conMap.put("r_verify", r_verify);
        conMap.put("r_publish", r_publish);
        conMap.put("r_status", r_status);

        //把状态码也放入Map集合中
        conMap.put("goId", goId);

        //回显数据
        model.addAttribute("page", articleService.findByPage(pageCode, pageSize, conMap));
    	if(goId==1) {
    		return "view/article/articleTrash";
    	}
    	return "view/article/articleManage";
    }
    
    @RequestMapping("/saveArticle")
    public String saveArticle(Article article,Model model) {
    	articleService.saveArticle(article);
    	model.addAttribute("message","文章添加成功！");
    	return "view/info/message";
    }
    private List<Words> lw_list;
    private List<Reply> lr_list;
    @SuppressWarnings("unused")
	@RequestMapping("/toArticleView")
    public String toArticleView(@RequestParam int r_id,Model model) {
    	//封装留言信息
    	lw_list=articleService.findByWords();
    	model.addAttribute("lw_list",lw_list);
    	//封装回复信息
    	lr_list=articleService.findByReply();
    	model.addAttribute("lr_list",lr_list);
    	
    	//查询文章信息
    	Article article=articleService.findById(r_id);
    	System.out.println("查询到文章的ID值："+article.getR_id());
    	if(article!=null) {
    		model.addAttribute("article",article);
    		return "view/article/articleView";
    	}
    	return null;
    }
    
    @RequestMapping("/clean")
    public String delete(@RequestParam int r_id) {
    	articleService.delete(r_id);
    	return "redirect:findByPage";
    }
    @RequestMapping("/toEditPage")
    public String toEditPage(@RequestParam int r_id,Model model) {
    	Article article=articleService.findById(r_id);
    	if(article!=null) {
    		model.addAttribute("article",article);
    		return "view/article/articleUpdate";
    	}else {
    		return null;
    	}
    }
    
    @RequestMapping("/restore")
    public String restore(@RequestParam int r_id) {
    	articleService.restore(r_id);
    	return "redirect:findByPage";
    }
    @RequestMapping("/deletes")
    public String deletes(@RequestParam int r_id) {
    	articleService.deletes(r_id);
    	return "redirect:findByPage";
    }
    
    @RequestMapping(value="/update")
    public String update(Article article,Model model){
        if(article != null){
            articleService.update(article);
            return "redirect:toArticleManage";
        }else{
            model.addAttribute("message","文章信息获取失败");
            return "view/info/message";
        }
    }

    @RequestMapping(value="/saveWords")
    public String saveWords(Words words){
        if(words != null){
            String r_id = words.getLw_for_article_id();
            articleService.saveWords(words);
            return "redirect:toArticleView?r_id="+r_id;
        }else{
            return null;
        }
    }

    @RequestMapping(value="/saveReply")
    public String saveReply(Reply reply){
        if(reply != null){
            articleService.saveReply(reply);
            String r_id = reply.getLr_for_article_id();
            return "redirect:toArticleView?r_id="+r_id;
        }else{
            return null;
        }
    }
}
