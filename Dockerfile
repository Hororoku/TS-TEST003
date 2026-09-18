# Python 3.13 ベースイメージ
FROM python:3.13-slim

# 環境変数
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# 作業ディレクトリ
WORKDIR /app

# 依存関係ファイルをコピー
COPY requirements.txt /app/

# 必要パッケージのインストール
RUN pip install --no-cache-dir -r requirements.txt

# アプリケーションコードをコピー
COPY main.py /app/
COPY pyproject.toml /app/

# Azure App Service / コンテナでの公開ポート
EXPOSE 8000

# コンテナ起動コマンド
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

