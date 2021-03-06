FROM amazon/aws-cli as installer

RUN yum install -y \
    python3 \
    tar

# install pip
RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN python3 get-pip.py --user
RUN ln -s /root/.local/bin/pip /usr/local/bin/pip

RUN pip install aws-sam-cli

COPY --from=node:12 /usr/local/bin/ /usr/local/bin/
COPY --from=node:12 /usr/local/lib/node_modules/ /usr/local/lib/node_modules/
COPY --from=node:12 /opt/ /opt/

RUN aws --version
RUN sam --version
RUN node --version
RUN npm --version
RUN yarn --version

