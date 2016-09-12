## Docker image for CI pipeline

Copy github key:

    $ cp ~/.ssh/id_rsa .

Build this image:

    $ docker build -t malston/openvpn-home .

Login and remove:
    $ docker run -it --rm malston/openvpn-home
