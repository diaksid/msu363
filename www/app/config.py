debug = False
test = False

server = ('127.0.0.1', 7100)

session_key = b'7srE0rxRYj5qXEEff64Z_dDOVTqvpqLT'

database = dict(
    auth=False,
    login='admin',
    passw='1234567',
    host=['127.0.0.1:27017'],
    name='msu363',
)

redis = dict(
    server=('127.0.0.1', 6379,),
    db=0,
)

memcache = dict(
    server=('127.0.0.1', 11211,),
    expire=60 * 60 * 24,
    prefix='msu363',
)

minify = dict(
    plain=True,
    strict=True,
    code=True,
)

static = '//web.msu363.ru/assets/3'
media = '//web.msu363.ru/media'

mail = dict(
    address=('МСУ 363', 'admin@msu363.ru',),
    recipients='info@msu363.ru',
    server=('smtp.yandex.ru', 465,),
    user=('admin@msu363.ru', '+1234567',),
    ssl=True,
    prefix='МСУ',
)

yandex = {'metrika': 35113350,
          'search': {'key': '594c4d1b6a2080783a2f3d88323b04a21b1dcdb',
                     'searchid': 2253689,
                     'login': 'msu363',
                     }}
