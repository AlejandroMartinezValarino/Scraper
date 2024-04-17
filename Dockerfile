FROM python:3.12-alpine

RUN apk update && apk add --no-cache \
    chromium \
    chromium-chromedriver

ENV DISPLAY=:99 \
    JOBLIB_TEMP_FOLDER=/temp

RUN mkdir /temp /output

COPY requirements.txt scraper.py ./

RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "scraper.py"]

VOLUME ["/temp", "/output"]
