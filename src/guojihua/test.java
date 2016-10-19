package guojihua;

import java.util.Locale;
import java.util.ResourceBundle;

public class test {

	public static void main(String[] args) {
		
		//native2ascii.exe可以使用这个查询对应的ascall码
		//资源包,包名加基名，资源的文件名必须是基名加对应的语言的格式名
		String basename = "myproperties.myproperties";
		 //设置语言环境
		Locale cn=Locale.CHINA;
		Locale us=Locale.US;
		//对应的语言环境的格式名
		System.out.println(us.toString()+":"+cn.toString());
		 //根据基名和语言环境加载对应的语言资源文件
		//在资源包下面，根据基名加对应的语言名去找对应的文件名，如果找不到就找基名的文件
		ResourceBundle myResourcesCN =ResourceBundle.getBundle(basename,cn);
		ResourceBundle myResourcesUS =ResourceBundle.getBundle(basename,us);
		//加载资源文件后， 程序就可以调用ResourceBundle实例对象的 getString方法获取指定的资源信息名称所对应的值。
		//String value =  myResources.getString(“key");键值对
		String usernameCN = myResourcesCN.getString("username");
		 String passwordCN = myResourcesCN.getString("password");
		 String usernameUS = myResourcesUS.getString("username");
		 String passwordUS = myResourcesUS.getString("password");
		 
		 System.out.println(usernameCN+"--"+passwordCN);
		 System.out.println(usernameUS+"--"+passwordUS);
	}

}
