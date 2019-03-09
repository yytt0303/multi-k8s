docker build -t dckr303/multi-client:latest -t dckr303/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t dckr303/multi-server:latest -t dckr303/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t dckr303/multi-worker:latest -t dckr303/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push dckr303/multi-client:latest
docker push dckr303/multi-server:latest
docker push dckr303/multi-worker:latest

docker push dckr303/multi-client:$SHA
docker push dckr303/multi-server:$SHA
docker push dckr303/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deploment server=dckr303/multi-server:$SHA
kubectl set image deployments/client-deploment client=dckr303/multi-client:$SHA
kubectl set image deployments/worker-deploment worker=dckr303/multi-worker:$SHA
