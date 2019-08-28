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

### Ohter usages
You can annotate input images.
```rb
AmazonRekognition.individual_recognition(image_path)
```

Or you can also get user instances in a image.
```
User.in_the_image(image_path)
```
