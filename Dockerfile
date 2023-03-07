# instancia a imagem base da nossa aplicação
FROM python

# define o PYTHONUNBUFFERED como variável de ambiente no Dockerfile 
# para garantir q o logging seja exibido em tempo real e para q 
# a execução do python nao cause problemas de buffer
ENV PYTHONUNBUFFERED=1

# define o diretório de trabalho dentro do container
WORKDIR /app

# roda dentro do container comando de instalação do django(dependência do projeto)
RUN pip install django

# copia os arquivos do projeto pra dentro do diretório de trabalhjo definido no WORKDIR
COPY manage.py ./
COPY myproject ./myproject

# expõe a porta
EXPOSE 8000

# roda o comando pra iniciar a aplicação
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]