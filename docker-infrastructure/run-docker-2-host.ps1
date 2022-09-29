
# Works on Windows Docker Desktop (and probably also MacOS Docker Desktop)
$dockerHostIp=docker run --rm nginx:alpine getent hosts host.docker.internal
$dockerHostIp = $dockerHostIp -split '\s+'
$dockerHostIp = $dockerHostIp[0].Trim()
Set-Content -Path .env -Value "DOCKER_HOST_IP=$dockerHostIp"

# Another solution which works on Linux, might also be to inspect the docker network  (using the default docker network which is used if not otherwise specified).
# This retrieves a JSON and we need to parse out [0].IPAM.Config.Gateway... this is a poor man's crappy solution for it... Better would be to use something like jq:
# dockerHostIp=$(docker network inspect local_default | grep -o '"Gateway": "[^"]*' | grep -o '[^"]*$')

docker-compose -f docker-compose-docker-2-host.yml up -d --remove-orphans

docker-compose -f docker-compose-docker-2-host.yml logs --follow