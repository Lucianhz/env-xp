-- # 更新property
UPDATE ofproperty
SET propValue = 'admin@im.deve.xiaopao69.com'
WHERE name = 'admin.authorizedJIDs';
UPDATE ofproperty
SET propValue = 'http://app.deve.xiaopao69.com/fileServer/private/upload/mucimage'
WHERE name = 'plugin.restapi.fileserver';
UPDATE ofproperty
SET propValue = 'im.deve.xiaopao69.com'
WHERE name = 'xmpp.domain';
-- 因为这个值的实际意思是 是否dev
UPDATE ofproperty
SET propValue = 'true'
WHERE name = 'plugin.offlinepush.enabled';

-- # plugin.offlinepush.dcName 证书名称
-- # red.domain	47.100.107.147 什么意思？

UPDATE ofmsgpush
SET jid     = REPLACE(jid, 'im.xiaopao69.com', 'im.deve.xiaopao69.com')
  , jidFrom = replace(jidFrom, 'im.xiaopao69.com', 'im.deve.xiaopao69.com');
UPDATE ofmucaffiliation
SET jid = REPLACE(jid, 'im.xiaopao69.com', 'im.deve.xiaopao69.com');
UPDATE ofmucconversationlog
SET sender = REPLACE(sender, 'im.xiaopao69.com', 'im.deve.xiaopao69.com');
UPDATE ofmucmember
SET jid = REPLACE(jid, 'im.xiaopao69.com', 'im.deve.xiaopao69.com');
UPDATE ofroster
SET jid = REPLACE(jid, 'im.xiaopao69.com', 'im.deve.xiaopao69.com');
-- # domain 更新完毕
-- # 更新后台管理员admin密码，以及IM admin密码
UPDATE ofuser
SET encryptedPassword = 'c6638f29e736b8b4edef646780730badcd192b6821ca61ba',
  serverKey           = '4MklJIx0ltam8WqNK0I0elJ+ae4=',
  storedKey           = '08+KlxrdNOfpdYhyNncLjQbDnmg=',
  salt                = 'C3eSEIQuLDYDH4AsJlVoK51uaRNpFbus',
  iterations          = 4096
WHERE username = 'admin';
UPDATE `auth_user`
SET `pwd` = '202276e1a523a8a893f3bc67328e1472'
WHERE `username` = 'admin';

# 设置沙盒支付宝
# 商家账号 efmlmv9242@sandbox.com
# 商户UID 2088102175007861
# 登录密码 111111
# 买家账号 ujqvfw0621@sandbox.com
# 登录密码 111111
# 支付密码 111111
# 用户名称 沙箱环境
# 证件类型 身份证(IDENTITY_CARD)
# 证件号码 568170192103029544
UPDATE `bet_payment_interface`
SET `state` = 0;
DELETE FROM `bet_payment_interface`
WHERE `id` = 'sandbox_alipay';
INSERT INTO `bet_payment_interface` (`id`, `bankname`, `banktype`, `state`, `remarks`, `type`, `agentid`)
VALUES ('sandbox_alipay', '测试支付宝', '支付宝', 1, '测试支付宝', 1, 1);
UPDATE `bet_alipay`
SET `state` = 0;
DELETE FROM `bet_alipay`
WHERE `payment_id` = 'sandbox_alipay';
INSERT INTO `bet_alipay` (`appid`, `payment_id`, `state`, `remark`, `email`, `RSA2privateKey`, `RSA2publickey`, `RSA1privateKey`, `RSA1publickey`, `alipaypublickey`)
VALUES ('2016091000480041', 'sandbox_alipay', 1, '支付宝', 'efmlmv9242@sandbox.com',
        'MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCWRRrB37WLLGAxPyi7yArFo0KitrZG3kC+fl2TdOMQ5ov++w+yBkm2YTpQUMKaXM7sVBDsUEpz6ZU1IexUtsldGfyvgFtS8o/qzCnQWEf3r9YnRqXUHWTgHeSEoB+4EHKmIPfAp2fBxJeTH7vbaE+yeb+E9/RBEjZzVx/bXe2xuXaildi4DJe2B+8E+lNMhYxv7gr1qApXUR/0oa9EKVhUkWKOUW/jkmbTopcDmGfl3kGa6lKI3+UPSaIeDrz7Dzt1dJNtF47cKT9NeuOLW1Rmym6VoxpHa0LU/9tAsw2pGP3g1VnADWDbpHj53oCNiyLXkzLOwx+geeRqSMlgXQ27AgMBAAECggEBAJV4P1lA0C+TAEt762R9YlmcPxfibgSn5faVczbNOV8CM5Z42+/UWVXT+FETQ76POjPQmtS0OJp7aTLkf1L0Te8RfkqDflNPet+uHJlkdpFkkbuXhjMq2cAje76AF4zar2+Xs1gqLAaNKcfp9M4VP9DjUSFOEeL33rlzm/hzwY7Ywbmwt1DU1qNCeeX5+Lx2ZJeEp6ieWP7/iKcprOK4FiWIApBbdwEf1tagO73eNGyfkK/DGRe/3Ud+54WFSPVt/+S2Mlglit6ErDWKKq6u7TEyhYmMryVblMMa5kTbn6wzPBuwmP4bWi4r8tWkWqU3ZdOqXBPjd6KpqZtwq4g5oQECgYEA71mDqT3JLLGD0fYCyM4nPJEQOjBWahcJGxEGq1E0JPOS3B9cSTS5ZJWGD2mjt2sKKjWds1Qdd191yc1/gIWZV7r3AzRGj3zTO4lld64bmjVXcDo1ox3QpnTBR1P3nKYoJD0zuGUef7HwBaHzxw8ZaW5cv3XKWEmBaAN3oRMOv9sCgYEAoLk0LKzoG2w3+GSsLVVLWQlqaLaXmcIb+V0+CYIe1x31Pbe+EHAEwb/5/kkw9BvvGs6b/j8bicqsJ1eP8vLRVrgYN2W6KVBKBLsu8lcz5j0zQPnqsLHE+9taRDCVyUsgEYSq1S6uYTI558CRzFJ35sPNaNBnlnJgcXLTNBx2v6ECgYEAmBi8D9oRcvNDHzNDxbMrP9O3CiMZZsVIpgiFwmwRxMF7u6G6FVMJ1J8n17d7r9y3UudLVV/IcckZoqmRsmwza4qF2WVoyVm7KYRAFHNxWuc2rzxuRT93Da/3+omjOcpki9LQgQbRALhkHFA0B3TS4yqciZYihUQAlcZOSO9BWi0CgYBrDXEXIMQpH9fX9xZHy7w4PfFGdfhcTdJcMiMUKjtohWfICA7s2/APLVPSb+XPcpu8e0mj+1zYVsp8GfKjm+Cbplta6sMoqXXj2NnYSQUkojb1XIFZ186hAuYI7WOXhBaEFJ3FCSbVTqMLHlT+hx+d8WVsHwQgTWa3qgfLefoOgQKBgElMpb9CIepaxu1+HKxkD0/MjPfFwtYyxG1aoJlH9mZr3mVsX1/9RnreQNt6aZUGg36fF9YvSwXY+popNVj4f2AyBrdGinFZR0Wmu6Ju8C+XeliIt4ibfUxADnk8uhzL48yraidusG0iOcLAsyT6+pHXIWEteY1aMMzDxTHnwp+N'
        #       这个就是交换公钥所用的
  ,
        'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAlkUawd+1iyxgMT8ou8gKxaNCora2Rt5Avn5dk3TjEOaL/vsPsgZJtmE6UFDCmlzO7FQQ7FBKc+mVNSHsVLbJXRn8r4BbUvKP6swp0FhH96/WJ0al1B1k4B3khKAfuBBypiD3wKdnwcSXkx+722hPsnm/hPf0QRI2c1cf213tsbl2opXYuAyXtgfvBPpTTIWMb+4K9agKV1Ef9KGvRClYVJFijlFv45Jm06KXA5hn5d5BmupSiN/lD0miHg68+w87dXSTbReO3Ck/TXrji1tUZspulaMaR2tC1P/bQLMNqRj94NVZwA1g26R4+d6AjYsi15MyzsMfoHnkakjJYF0NuwIDAQAB'
  ,
        'MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAMTh0fvUzn57qFaNKHQ05GCPYvYt+/56T+6F9n4CE6uEx6WXDtz9aYZe4Ug1NtVqQBcLofVE3ww0G0nRJIS6Pa3QH3D107+nJoX9wP/UW46gp9NhoCym69LCLh6UbTxTUoDZCTAKCJRCRFSILg9n+2G+NYzx/IDTINJkQhnC7Vw5AgMBAAECgYB781/sGDJY1ylINF5/qr0NPbikHJdFw2OHW7ev5UbU+SdoTQ4Ce1hwTFOwzi/TdK0c1SoF7HIwkK2Nb6p6FXa2V1mk2bQ6LNMyf6oxSnADnjHj7TjGAQD/3HKHQqPq9cMnjTfw2NuM8BjBspUDRJJxqg+BJ4PmD+XiZSDrtfFbMQJBAPReQVTlgkxYHDNgrWYMlf7qd6p+7Adwp0sdByXaNOFDAZCVZdoOYpUSIErD46C4H8wmXo3hJOmJirQxjL25f6sCQQDOQOyZQU6YyzDqCj8X9TDhibki/E2K0FDVFpQDHdPWiVJcFi/8oD3dTuH/FFAzoh+xeZtMrAPCZz4W11byzj+rAkEA3148t55mYOR1Op1XQp2kifPGWIlVtGNL+APbocT4ayO1jXSSOiTGBd8gt1ahfipvnktASM4Q0IvRxm44aL/jqwJAQAmwbDT2rkIIQeJEjK+4KY6VSOOFP+BF+KM1+XG9YBLq22SYKZunGZtwV7562E0yAex752ZRFH7xrC3X9TNMWQJAYuAKvyblkwpAPMBqt1DmAU3KfCzTD6oNKYWEzDnN7Sna1F+w4Q3o1p9waGXgzTKU2qWQ2dv5sl1ozQ8hWL0sVw=='
        #       另一个交换公钥的地方
  ,
        'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDE4dH71M5+e6hWjSh0NORgj2L2Lfv+ek/uhfZ+AhOrhMellw7c/WmGXuFINTbVakAXC6H1RN8MNBtJ0SSEuj2t0B9w9dO/pyaF/cD/1FuOoKfTYaAspuvSwi4elG08U1KA2QkwCgiUQkRUiC4PZ/thvjWM8fyA0yDSZEIZwu1cOQIDAQAB'
  , 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA9mquFQKCDxjOUmezdRerzXoSEjf3IIr6Uh7o+YXtkprrABWiSDjHbEqWihBxrOY505gkqhY9XHbWHUYiDliV5/VaAPn5FHohz+Rw2DMWDFwrj7BrMXmI3exL43gfRZh9C3mBLmlzU8cm5hKHuTL3TBxIK8lO1bWOivI9zOGAJOiSqvwZQniON+r9mZoqewLrmc9XxXWDZH/UsC0rCtH2R+IZhn+4nHPqsVkS6pXB7/Dj7C39XO5ck/okdmR2ML2ZHwJlHs+H6rKosn02RQouBSNPDWnlLZNGH3M3qLrNYjEeKhqfLwzeQaNtANncCVdhLKksEnT97EFi1hqqaxHAHQIDAQAB');
