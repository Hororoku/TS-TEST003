from fastapi import FastAPI
from fastapi.responses import JSONResponse

app = FastAPI(
    title="Sample Azure App Service API",
    version="1.0.0",
    description="FastAPI sample running on Azure App Service with Docker",
)


@app.get("/", response_class=JSONResponse)
async def root():
    return {
        "service": "root",
        "message": "Hello from Azure App Service FastAPI!",
        "status": "ok",
    }


@app.get("/help", response_class=JSONResponse)
async def help():
    return {
        "service": "help",
        "usage": {
            "GET /": "Returns basic service status.",
            "GET /help": "Returns help information for this API.",
        },
        "status": "ok",
    }
