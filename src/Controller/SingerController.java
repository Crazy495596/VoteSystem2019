package Controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import Model.ResultMsg;
import Model.Singer;
import Service.SingerService;
import net.sf.json.JSONObject;

@Controller
public class SingerController {
	@Autowired
	private SingerService singerService;

	@RequestMapping("/add_singer")
	public ModelAndView add_singer() {
		ModelAndView mView = new ModelAndView("add_singer");
		return mView;
	}
	
	

	@ResponseBody
	@RequestMapping("/add_singer_submit")	  
	 public void add_singer_Submit(String singerName,MultipartFile multipartFile,Integer singerSex,HttpServletRequest request,HttpServletResponse response) throws IllegalStateException, IOException, ServletException { 
		
		System.out.println(singerName+"   "+multipartFile+" "+singerSex);
		 //�ϴ��ļ���������
	      //��ȡͼƬ�ڷ������ϵ�����·������Ŀ���ڷ�����������·����
	      String realPath=request.getServletContext().getRealPath("./upload/");//getServletContext��Ŀ������
	      System.out.println(realPath);
	      String filename=multipartFile.getOriginalFilename();   //�ļ����ͺ�׺
	      String path=realPath+filename;
	      File file1=new File(path);

	      //û��upload�ļ��У�����һ��
	      if(!file1.getParentFile().exists()){
	          file1.getParentFile().mkdirs();
	      }

	      //�����ļ���filel��
	      System.out.println(path);
	      multipartFile.transferTo(file1);
		
		
		
		//��������
		  Singer singer = new Singer(); 
		  singer.setSingerName(singerName);
		 singer.setSingerSex(singerSex);
		 singer.setSingerImg(path);
		
	  
	  
	
		  int i = singerService.addSinger(singer); 
		  System.out.println(i); 
		  
		  
		  if(i>0){
		    	JOptionPane.showMessageDialog(null, "��Ӹ��ֳɹ���", "��ʾ", JOptionPane.ERROR_MESSAGE); 
			  request.getRequestDispatcher("/add_singer").forward(request,response);

		  }else{ 
		    	JOptionPane.showMessageDialog(null, "��Ӹ���ʧ�ܣ�", "��ʾ", JOptionPane.ERROR_MESSAGE); 
			  request.getRequestDispatcher("/add_singer").forward(request,response);
		  }
		 
	  }
	

	@RequestMapping("/singer_list")
	public ModelAndView singer_list() {
        List<Singer> singers=singerService.getSingers();
		ModelAndView mView = new ModelAndView("singer_list");
		mView.addObject("singers",singers);
		return mView;
	}

}
