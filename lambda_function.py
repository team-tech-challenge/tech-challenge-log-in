import json
import boto3
import hmac
import hashlib
import base64
import os
from botocore.exceptions import ClientError

cognito = boto3.client('cognito-idp')

def calculate_secret_hash(client_id, client_secret, username):
    message = username + client_id
    dig = hmac.new(
        str(client_secret).encode('utf-8'),
        msg=str(message).encode('utf-8'),
        digestmod=hashlib.sha256
    ).digest()
    return base64.b64encode(dig).decode()

def lambda_handler(event, context):
    body = event['body']
    username = body['username']
    password = body['password']

    client_id = os.environ['client_id']
    client_secret = os.environ['client_secret']
    
    secret_hash = calculate_secret_hash(client_id, client_secret, username)

    params = {
        'AuthFlow': 'USER_PASSWORD_AUTH',
        'ClientId': client_id,
        'AuthParameters': {
            'USERNAME': username,
            'PASSWORD': password,
            'SECRET_HASH': secret_hash
        }
    }

    try:
        # autenticação
        auth_result = cognito.initiate_auth(**params)
        return {
            'statusCode': 200,
            'body': json.dumps(auth_result['AuthenticationResult'])
        }
    except ClientError as error:
        return {
            'statusCode': 400,
            'body': json.dumps({'error': error.response['Error']['Message']})
        }
