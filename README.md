
## Getting Started

To get this project up and running on your local machine, follow these steps:

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/Tezlaa/autoria_scraping.git
   ```
2. **Navigate to the folder**
    ```bash
    cd autoria_scraping
    ```
3. **Rename `.env-example` to `.env`**
   
\
4.1 **Build and run Docker Container with celery.** _Start scraping at 12 p.m. and dumps database at 12 a.m._

```bash
docker-compose build --up
```

4.2 **Build and run Docker Container without celery.** _Start scraping. Dump the database only at the end or restart_

```bash
docker-compose -f docker-compose-without-celery.yml up --build
```
\
\
**Stop Docker Containers:**
```bash
docker-compose down
```
```bash
docker-compose -f docker-compose-without-celery.yml down
```
