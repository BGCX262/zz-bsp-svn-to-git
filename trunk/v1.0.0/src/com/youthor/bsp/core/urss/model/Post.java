/**
 * 
 */
package com.youthor.bsp.core.urss.model;

import java.io.Serializable;

/**
 * @author 胡友成  2007-11-17
 *
 */
public class Post implements Serializable{

    private static final long serialVersionUID = 2632604133047758942L;
    
    private String postId;
    private String postName;
    private String comId;
    private String postMemo;
    
    public String getPostId() {
        return postId;
    }
    public void setPostId(String postId) {
        this.postId = postId;
    }
    public String getPostName() {
        return postName;
    }
    public void setPostName(String postName) {
        this.postName = postName;
    }
    public String getComId() {
        return comId;
    }
    public void setComId(String comId) {
        this.comId = comId;
    }
    public String getPostMemo() {
        return postMemo;
    }
    public void setPostMemo(String postMemo) {
        this.postMemo = postMemo;
    }

}
