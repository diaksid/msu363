import sys, multiprocessing


assert sys.version_info >= (3, 5), 'Please use Python 3.5 or higher.'


bind = '127.0.0.1:7100'
worker_class = 'aiohttp.worker.GunicornWebWorker'
workers = multiprocessing.cpu_count() + 1
max_requests = 5000
reload = True
user = 'ppd'
