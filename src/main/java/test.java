import java.util.StringTokenizer;

public class test {
	public static void main(String[] args) {
		String str = "gkgkgk:gkgkgk:;:gzzzzz";
		StringTokenizer st = new StringTokenizer(str.replace(":;:", "\\"), "\\");
		while(st.hasMoreTokens()) {
			System.out.println(st.nextToken());
		}
	}
}
