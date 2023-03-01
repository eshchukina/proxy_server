
#docker network create --subnet=172.21.0.0/16 dev

.PHONY: nginx

nginx:
	docker stop nginx_proxy || true
	docker rm nginx_proxy || true
	docker run -d --name nginx_proxy --network dev \
        -p 80:80 \
		-v $(PWD)/nginx/static_html:/usr/share/nginx/html \
		-v $(PWD)/nginx/local.conf.d:/etc/nginx/conf.d \
		nginx


