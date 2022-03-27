package project.spring.web.s3;

import java.io.File;
import java.io.InputStream;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.SdkClientException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

//파일 업로드를 위한 s3 패키지
//이렇게 하는게 맞는지 자신은 없음... 거지같네 그냥 url때려박으면 안되는건가
@Service
public class AwsS3 {
	private final static String NAMESPACE = "AdminBannerManagementDAO";

	private SqlSessionTemplate sqlSession;

	// Amazon-s3-sdk
	private AmazonS3 s3Client;

	// 보안상의 문제로 수정 요망
	private String accessKey = "AKIAZI224T6ADGZF4CML"; // IAM 에서 만든 엑세스
	private String secretKey = "tstWvOI9H8ooB+6mSIlLeuuEeHr2jUt5pGlxhrWJ"; // IAM에서 받은 시크릿 엑세스
	private Regions clientRegion = Regions.AP_NORTHEAST_2;
	private String bucket = "saladits3"; // 버킷 명

	// 기본 생성자
	public AwsS3() {

	}

	// asw S3 Client 생성
	public AwsS3(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
		createS3Client();
	}

	// asw S3 Client 생성
	private void createS3Client() {

//		
//		//db에 넣은 암호화된s3값을 가져온다.
//		S3KeyVO keyVO = sqlSession.selectOne(NAMESPACE + ".getS3Key");
//		
//		//암호화된 s3키를 복호화하기 위한 decodingKey, docodingIv 값을 가져와서 바이트형태로 바꾸기
//		SecretKey decodingKey = new SecretKeySpec(keyVO.getDecoding_key().getBytes(),"AES");
//		IvParameterSpec decodingIv = new IvParameterSpec(keyVO.getDecoding_iv().getBytes());
//		
//		try {
//			accessKey = SecurityUtil.decrypt("AES/CBC/PKCS5Padding", decodingKey, decodingIv, keyVO.getAccesskey());
//			secretKey = SecurityUtil.decrypt("AES/CBC/PKCS5Padding", decodingKey, decodingIv, keyVO.getSecretkey());
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		
		// AWS 접근하기 위해
		AWSCredentials credentials = new BasicAWSCredentials(accessKey, secretKey);
		this.s3Client = AmazonS3ClientBuilder.standard().withCredentials(new AWSStaticCredentialsProvider(credentials))
				.withRegion(clientRegion).build();
	}

	// file 올릴때
	public void upload(File file, String key) {
		uploadToS3(new PutObjectRequest(this.bucket, key, file));
	}

	public void upload(InputStream is, String key, String contentType, long contentLength) {
		ObjectMetadata objectMetadata = new ObjectMetadata();
		objectMetadata.setContentType(contentType);
		objectMetadata.setContentLength(contentLength);

		uploadToS3(new PutObjectRequest(this.bucket, key, is, objectMetadata));
	}

	// 위에서 정의한 파일 업로드 관련 메소드들에 필요한 메소드
	private void uploadToS3(PutObjectRequest request) {
		try {
			this.s3Client.putObject(request);
			System.out.println(String.format("[%s] upload complete", request.getKey()));
		} catch (AmazonServiceException e) {
			e.printStackTrace();
		} catch (SdkClientException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 삭제
	public void delete(String key) {
		try {
			// Delete 객체 생성
			DeleteObjectRequest deleteObjectRequest = new DeleteObjectRequest(this.bucket, key);

			// Delete
			this.s3Client.deleteObject(deleteObjectRequest);
			System.out.println(String.format("[%s] deletion complete", key));
		} catch (AmazonServiceException e) {
			e.printStackTrace();
		} catch (SdkClientException e) {
			e.printStackTrace();
		}
	}
}