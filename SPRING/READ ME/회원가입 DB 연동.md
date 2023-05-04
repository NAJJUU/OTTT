DB 연동을 할 때 MyBatis를 사용하기 위해 DB연동을 위한 dataSource와 MyBatis사용을 위한 sqlSessionFactory와 sqlSession을 
root-context.xml에 bean으로 등록해주었다.        
그리고 pom.xml에 MyBatis 관련한 dependency도 추가해 주었다.   
이때 sqlSessionFactory에 config와 mapper의 위치를 property로 추가해주는데 config는 하나만 만들어야한다는 사실을 
깜빡하고 mapper와 동일하게 기능별로 폴더를 만들었다가 계속 오류가 나서 꽤 오랜시간 쩔쩔거렸다는...
#### config는 하나만!!!!

![image](https://user-images.githubusercontent.com/122864238/236083372-bd7f40e9-eab4-4be3-9c0d-6d179faacafe.png)

![image](https://user-images.githubusercontent.com/122864238/236083383-dc4370b9-cf24-411a-8b26-2e1fccff9444.png)
















