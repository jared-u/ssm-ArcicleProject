package cn.jared.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.jared.mapper.ArticleMapper;
import cn.jared.pojo.Article;
import cn.jared.pojo.PageBean;
import cn.jared.pojo.Reply;
import cn.jared.pojo.Words;
import cn.jared.service.ArticleService;

@Service
public class ArticleServiceImpl implements ArticleService{
	@Autowired
	private ArticleMapper articleMapper;

	@Override
	public PageBean<Article> findByPage(int pageCode, int pageSize, Map<String, Object> conMap) {
		PageBean<Article> pageBean=new PageBean<Article>();
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		Integer goId=(Integer)conMap.get("goId");
		
		
		pageBean.setPageCode(pageCode);
		pageBean.setPageSize(pageSize);
		//总记录数
		int totalCount=0;
		if(goId==0) {
			totalCount=articleMapper.selectCount();
		}else if(goId==1){
			totalCount=articleMapper.selectCount2();
		}
		pageBean.setTotalCount(totalCount);
		
		//总页数
		double tc=totalCount;
		Double num=Math.ceil(tc/pageSize);//取上整
		pageBean.setTotalPage(num.intValue());
		
		//设置limit起始位置和数据条数
		map.put("goId",goId);
		map.put("start", (pageCode-1)*pageSize);
		map.put("size", pageBean.getPageSize());
		
		//封装显示的数据
		List<Article> list=articleMapper.findByPage(map);
		pageBean.setBeanList(list);
		
		for(Object object:list) {
			System.out.println(object);
		}
		conMap.put("start",(pageCode - 1) * pageSize);
        conMap.put("size",pageBean.getPageSize());

        List<Article> conList = articleMapper.findConByPage(conMap);
        pageBean.setBeanList(conList);
		return pageBean;
	}

	@Override
	public void saveArticle(Article article) {
		articleMapper.saveArticle(article);
	}

	@Override
	public List<Words> findByWords() {
		return articleMapper.findByWords();
	}

	@Override
	public List<Reply> findByReply() {
		return articleMapper.findByReply();
	}

	@Override
	public Article findById(int r_id) {
		
		
		return articleMapper.findById(r_id);
	}

	@Override
	public void delete(int r_id) {
		articleMapper.delete(r_id);
	}

	@Override
	public void restore(int r_id) {
		articleMapper.restore(r_id);
	}

	@Override
	public void deletes(int r_id) {
		articleMapper.deletes(r_id);
	}

	@Override
	public void saveWords(Words words) {
		articleMapper.saveWords(words);
	}

	@Override
	public void update(Article article) {
		articleMapper.update(article);
	}

	@Override
	public void saveReply(Reply reply) {
		articleMapper.saveReply(reply);
	}
	
	
}
