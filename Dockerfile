FROM public.ecr.aws/lambda/python:3.12

RUN pip install --upgrade pip

COPY src/ ${LAMBDA_TASK_ROOT}

CMD [ "lambda_function.lambda_handler" ]
