# setup storage requirements
./pv/create_storage.sh

CONFIGURATOR_USERNAME=admin
sed -i "s/\(configurator_username: \)\(.*\)/\1${CONFIGURATOR_USERNAME}/" values.yaml

CONFIGURATOR_PASSWORD=$(date +%s | sha256sum | base64 | head -c 32 ; echo)
sed -i "s/\(configurator_password: \)\(.*\)/\1${CONFIGURATOR_PASSWORD}/" values.yaml

helm install --name home-assistant . --values values.yaml
