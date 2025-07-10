package com.tech.blog.dao;
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    public ArrayList<Category> getAllCategories(){
        ArrayList<Category> list=new ArrayList<>();
        try{
            String q="select * from categories";
            Statement st=this.con.createStatement();
            ResultSet set=st.executeQuery(q);
            while(set.next()){
                int cid=set.getInt("cid");
                String name=set.getString("name");
                String description=set.getString("description");
                Category c=new Category(cid,name,description);
                list.add(c); 
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return list;
    }
    public  boolean savePost(Post p){
        boolean  f=false;
        try{
            String q="insert into posts(pTitle,pContent,pCode,postpic,catId,userId) values(?,?,?,?,?,?)";
            PreparedStatement ptst=con.prepareStatement(q);
            ptst.setString(1,p.getPtitle());
            ptst.setString(2, p.getPcontent());
            ptst.setString(3, p.getPcode());
            ptst.setString(4,p.getPostpic());
            ptst.setInt(5,p.getCatId());
            ptst.setInt(6,p.getUserId());
            
            ptst.executeUpdate();
            f=true;
           
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
//    get all the post
    public List<Post> getAllPosts(){
        List<Post> list=new ArrayList<>();
        //fetch all the post
        try{
            PreparedStatement p=con.prepareStatement("select * from posts order by pid desc");
            
            ResultSet set=p.executeQuery();
            while(set.next()){
                int pid=set.getInt("pid");
                String pTitle=set.getString("pTitle");
                String pContent=set.getString("pContent");
                String pCode=set.getString("pCode");
                String postpic=set.getString("postpic");
                Timestamp date=set.getTimestamp("pDate");
                int catId=set.getInt("catId");
                int userId=set.getInt("userId");
                Post post=new Post(pid,pTitle,pContent,pCode,postpic,date,catId,userId);
                list.add(post);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
        
    }
    public List<Post> getPostByCatId(int catId){
        List<Post> list=new ArrayList<>();
        //fetch all post by id
        try{
            PreparedStatement p=con.prepareStatement("select * from posts where catId=?");
            p.setInt(1,catId);
            
            ResultSet set=p.executeQuery();
            while(set.next()){
                int pid=set.getInt("pid");
                String pTitle=set.getString("pTitle");
                String pContent=set.getString("pContent");
                String pCode=set.getString("pCode");
                String postpic=set.getString("postpic");
                Timestamp date=set.getTimestamp("pDate");
                int userId=set.getInt("userId");
                Post post=new Post(pid,pTitle,pContent,pCode,postpic,date,catId,userId);
                list.add(post);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
        
    }
    
    public Post getPostByPostId(int postId){
        Post post=null;
        String q="Select * from posts where pid=?";
        try{
            PreparedStatement p=this.con.prepareStatement(q);
            p.setInt(1,postId);
            ResultSet set=p.executeQuery();
            
            if(set.next()){
                
                
                int pid=set.getInt("pid");
                String pTitle=set.getString("pTitle");
                String pContent=set.getString("pContent");
                String pCode=set.getString("pCode");
                String postpic=set.getString("postpic");
                Timestamp date=set.getTimestamp("pDate");
                int cid=set.getInt("catId");
                int userId=set.getInt("userId");
                post=new Post(pid,pTitle,pContent,pCode,postpic,date,cid,userId);
            }
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return post;
    }
            

}
