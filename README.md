## Docker image for CI pipeline

Copy github key:

    $ cp ~/.ssh/id_rsa .

Build this image:

    $ docker build -t malston/openvpn-pki .

Login and remove:

    $ docker run -it --rm malston/openvpn-pki
