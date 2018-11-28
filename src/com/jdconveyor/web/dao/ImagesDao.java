package com.jdconveyor.web.dao;

import com.jdconveyor.web.utils.Utils;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by lenovo on 2016/12/21.
 */
@Repository
public class ImagesDao extends BaseDao{

    public String path="assets/upload";
    public String thumbs=path+"/thumbs";

    public void saveFile(String url,String thumb,String name,String md5){
        String sql="insert into uploadfile(url,thumb,name,type,tag,md5) values(?,?,?,'image','beach',?)";
        jdbcTemplate.update(sql,url,thumb,name,md5);
    }

    public Map<String,Object> getUploadfileByMd5(String md5){
        String sql="select * from uploadfile where md5=?";
        try {
            return jdbcTemplate.queryForMap(sql, new Object[]{md5});
        }catch (Exception e){

        }
        return null;
    }

    public List<Map<String,Object>> getAllFile(){
        String sql="select * from uploadfile";
        return jdbcTemplate.queryForList(sql);
    }





    //单个文件上传
    public String imageUpload(HttpServletRequest request, MultipartFile file) throws Exception {
        if(file==null||file.getSize()<=0){
            return "";
        }
        String md5= Utils.getFileMd5(file.getInputStream());

        Map<String,Object> md5file=getUploadfileByMd5(md5);
        if(md5file!=null&&!md5file.isEmpty()){
            return md5file.get("url").toString();
        }
        String filepath=request.getServletContext().getRealPath(path);
        String thumbsfilepath=request.getServletContext().getRealPath(thumbs);
        String oname=file.getOriginalFilename();
        String filename= UUID.randomUUID().toString()+oname.substring(oname.lastIndexOf("."),oname.length());
        File ufile=new File(filepath,filename);
        file.transferTo(ufile);
        File tfile=new File(thumbsfilepath,filename);
        Thumbnails.of(ufile).scale(1f).outputQuality(0.25f).toFile(tfile);
        saveFile(path+"/"+filename,thumbs+"/"+filename,oname,md5);
        return path+"/"+filename;
    }
    //多个文件上传
    public String[] imageUpload(HttpServletRequest request, MultipartFile[] files) throws Exception {
        List<String> paths=new ArrayList<>();
        for(MultipartFile file:files){
            paths.add(imageUpload(request,file));
        }
        return paths.toArray(new String[paths.size()]);
    }

    //单个附件上传
    public String fileUpload(HttpServletRequest request, MultipartFile file) throws Exception{
        String md5= Utils.getFileMd5(file.getInputStream());

        Map<String,Object> md5file=getUploadfileByMd5(md5);
        if(md5file!=null&&!md5file.isEmpty()){
            return md5file.get("url").toString();
        }

        String filepath=request.getServletContext().getRealPath(path);
        String oname=file.getOriginalFilename();
        String filename=UUID.randomUUID().toString()+oname.substring(oname.lastIndexOf("."),oname.length());
        File ufile=new File(filepath,filename);
        file.transferTo(ufile);
        saveFile(path+"/"+filename,"",oname,md5);
        return path+"/"+filename;
    }

}
