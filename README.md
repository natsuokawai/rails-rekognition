# Rails Rekognition
This is a sample of personal detection using Amazon Rekognition.

# Usage
### Basic steps
1. Register users
```rb
user = User.create(name: 'Alice')
```

2. Register images of her/his face
```rb
user.register_face(image_path)
```

3. Search faces by image
```rb
AmazonRekognition.search_all_faces_by_image(image_path)
```
This returns instances of RekognitionFace.

### Ohter usages
You can annotate input images.
```rb
AmazonRekognition.individual_recognition(image_path)
```

Or you can also get user instances in a image.
```
User.in_the_image(image_path)
```

### Example
Put these images in `app/assets/images`. Top two images are used for registering faces. The last one is used for testing.

okawa-san.jpg
<img src="https://user-images.githubusercontent.com/25678257/63835789-2ba3e100-c9b3-11e9-816e-ad1cc756ce50.jpg" width="500">

yusei-san.jpg
<img src="https://user-images.githubusercontent.com/25678257/63835794-2e063b00-c9b3-11e9-9a09-bcb38ca6deae.jpg" width="500">

test.jpg
<img src="https://user-images.githubusercontent.com/25678257/63836098-de743f00-c9b3-11e9-9927-e48ae138da9e.jpg" width="500">

Then, run following scripts.
```rb
user1 = User.create(name: "Okawa-san")
user1.register_face('app/assets/images/okawa-san.jpg')

user2 = User.create(name: "Yusei-san")
user2.register_face('app/assets/images/yusei-san.jpg')

AmazonRekognition.individual_recognition('app/assets/images/test.jpg')
```
Then, the output images is in `app/assets/images/`.
<img src="https://user-images.githubusercontent.com/25678257/63835795-30689500-c9b3-11e9-999f-52358138b6de.jpg" width="750">
