FROM node:7
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN apt-get update
RUN apt-get install -y ruby ruby-dev
CMD git clone https://github.com/bigbadblo/slack-bot.git
RUN cd slack-bot && gem install bundle && bundle && rackup -D config.ru
CMD node index.js alexa
