## 메인 작품들 slide로 넘기기 

![image](https://user-images.githubusercontent.com/122864238/231421266-b3dd8229-0254-4094-8026-fe5c447a6e62.png)

![image](https://user-images.githubusercontent.com/122864238/231422238-5cb5c2c1-7ec4-4394-991d-84e77a33b457.png)


#### 홈페이지에 들어갔을 때 보이는 별점 높은 작품들
![image](https://user-images.githubusercontent.com/122864238/231421623-f451846d-ccc8-4924-9254-f147ecb01d1c.png)

#### overflow: hidden;을 이용하여 숨김
![image](https://user-images.githubusercontent.com/122864238/231422553-21ab10ab-0514-48b0-a423-e12090f204af.png)

img의 class인 poster의 부모 태그 posterzip1에 overflow: hidden;을 주어 posterzip1밖으로 나가는 poster들은 다 안보이게 숨겨주었다.      
->그래서 메인페이지에 들어갔을 때 보이는 작품의 수는 7개이지만 실제로는 14개가 존재한다.

#### java script 이용해서 poster 넘겨주기
![image](https://user-images.githubusercontent.com/122864238/231423384-c675043d-5eb2-45e6-be3f-25cbf87b1461.png)


## 작품 hover 시 작품 정보 나타내기
![image](https://user-images.githubusercontent.com/122864238/231425942-4952e530-63cd-4109-adea-e5058039937e.png)

![image](https://user-images.githubusercontent.com/122864238/231426229-407dd3d0-934b-4719-82dd-7a2bb8483298.png)

![image](https://user-images.githubusercontent.com/122864238/231614255-1930942d-dda8-46c5-956e-c91c75f9c449.png)

display: none;과 display: block;을 이용하여 class="work-review"를 class="work-info"를 hover할 때만 보이게 해주었다.
display: none;과 display: block;는 부모와 자식관계에서만 사용할 수 있어서 부모와 자식관계를 만들어주기 위해서 div태그로 자식관계되는 부분을 다 묶어주었다.
그리고 poster 호버와 class="work-info" 호버를 따로 주었더니 두 개가 따로 놀아서 두 개의 호버를 같이 주었다.
