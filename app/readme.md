docker run -d \
  --name flask-app \
  -p 5000:5000 \
  flask-devops-app

  ## publicar la imagen

  docker login

  docker tag flask-devops-app TUUSUARIO/flask-devops-app:v1

  docker push TUUSUARIO/flask-devops-app:v1