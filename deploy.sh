NAME="kubernetes-api"
USERNAME="krayush2531"
IMAGE="${USERNAME}/${NAME}:latest"

echo "Building Docker image: ${IMAGE}"
docker build -t ${IMAGE} .
echo "Docker image built successfully: ${IMAGE}"

#echo "Pushing Docker image to registry: ${IMAGE}"
#docker push ${IMAGE}
#echo "Docker image pushed successfully: ${IMAGE}"

echo "Applying Kubernetes manifests..."
kubectl apply -f k8s/
echo "Kubernetes manifests applied successfully."

echo "getting Kubernetes pod status..."
kubectl get pods

echo "Getting Kubernetes services..."
kubectl get services

echo "Fetching the main application service..."
kubectl get service ${NAME}-service

