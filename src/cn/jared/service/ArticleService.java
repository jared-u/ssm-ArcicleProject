package cn.jared.service;

import java.util.List;
import java.util.Map;

import cn.jared.pojo.Article;
import cn.jared.pojo.PageBean;
import cn.jared.pojo.Reply;
import cn.jared.pojo.Words;

public interface ArticleService {

	PageBean<Article> findByPage(int pageCode, int pageSize, Map<String, Object> conMap);

	void saveArticle(Article article);

	List<Words> findByWords();
	List<Reply> findByReply();

	Article findById(int r_id);

	void delete(int r_id);

	void restore(int r_id);

	void deletes(int r_id);

	void saveWords(Words words);

	void update(Article article);

	void saveReply(Reply reply);
}
