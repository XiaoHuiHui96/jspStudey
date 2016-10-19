package bean;

import java.io.IOException;
import java.io.StringWriter;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.SkipPageException;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 * SimpleTagSupport实现了SimpleTag接口
 * 所以只要直接重现执行的方法就可以了
 * @author Administrator
 *
 */
public class SimpleTagDemo1 extends SimpleTagSupport {

	/** 标签的属性 */
	private int count;
	
	public void setCount(int count){
		this.count=count;
	}
	
	@Override
	public void doTag() throws JspException, IOException{
		System.out.println("自定义标签类逻辑处理方法");
		//标签对象
		JspFragment jf=this.getJspBody();
		//得到jsp页面的的PageContext对象
		//PageContext pageContext = (PageContext) jspFragment.getJspContext();
		//调用JspWriter将标签体的内容输出到浏览器
		//jspFragment.invoke(pageContext.getOut());
		//执行该标签，如果不执行则标签不起作用
		//jf.invoke(null);
		//循环执行
		/*for(int i=0;i<5;i++){
			jf.invoke(null);
		}*/
		
		//抛出异常，当遇到该异常，这该标签下面全部不执行
		// throw new SkipPageException();
		
		/*StringWriter sw=new StringWriter();
		//方法里传递一个写入流，接受标签体里的内容
		jf.invoke(sw);
		//转换成字符串
		String content=sw.getBuffer().toString();
		System.out.println(content);
		content=content.toUpperCase()+"修改后";
		//获取到jsp的上下文
		PageContext pageContext=(PageContext) this.getJspContext();
		//输出回浏览器
		pageContext.getOut().write(content);*/
		for(int i=0;i<count;i++){
			jf.invoke(null);
		}
		
	}
}
