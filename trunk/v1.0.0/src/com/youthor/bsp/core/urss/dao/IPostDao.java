/**
 * 
 */
package com.youthor.bsp.core.urss.dao;

import java.util.List;

import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.urss.model.Post;

/**
 * @author 胡友成  2007-11-17
 *
 */
public interface IPostDao {
    
    public List queryPagePostByComId(Page page,String comId);
    public String addPost(Post post);
    public String updatePost(Post post);
    public boolean deletePostByIds(String [] ids);
    public Post getPostById(String id);    
    public List getPostByComId(String comId);
}
