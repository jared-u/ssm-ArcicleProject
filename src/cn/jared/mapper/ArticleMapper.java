package cn.jared.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.jared.pojo.Article;
import cn.jared.pojo.Reply;
import cn.jared.pojo.Words;

public interface ArticleMapper {
	void saveArticle(Article article);
	
	int selectCount();
	
	List<Article> findConByPage(Map<String,Object> map);
	
	void delete(int r_id);
	
	void update(Article article);
	
	void clean(int r_id);
	
	int selectCount2();
	
	void restore(int r_id);

	List<Article> findByPage(HashMap<String, Object> map);

	List<Words> findByWords();
	List<Reply> findByReply();

	Article findById(int r_id);

	void deletes(int r_id);

	void saveWords(Words words);

	void saveReply(Reply reply);
}
