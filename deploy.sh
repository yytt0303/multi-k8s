docker build -t dckr303/multi-client:latest -t dckr303/multi-client:$SHA -f ./client/Dockerfile.dev ./client
docker build -t dckr303/multi-server:latest -t dckr303/multi-server:$SHA -f ./server/Dockerfile.dev ./server
docker build -t dckr303/multi-worker:latest -t dckr303/multi-worker:$SHA -f ./worker/Dockerfile.dev ./worker
docker push dckr303/multi-client:latest
docker push dckr303/multi-server:latest
docker push dckr303/multi-worker:latest

docker push dckr303/multi-client:$SHA
docker push dckr303/multi-server:$SHA
docker push dckr303/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deploments/server-deploment server=dckr303/multi-server:$SHA
kubectl set image deploments/client-deploment client=dckr303/multi-client:$SHA
kubectl set image deploments/worker-deploment worker=dckr303/multi-worker:$SHA
