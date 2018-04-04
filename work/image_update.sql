SELECT
  roomMark,
  type,
  img,
  concat('https://www.xiaopao69.com/red-admin/upload/icon_0329_', type, '.png')
FROM `ofmucroom`
WHERE type > 0;
UPDATE `ofmucroom`
SET img = concat('https://www.xiaopao69.com/red-admin/upload/icon_0329_', type, '.png')
WHERE TYPE > 0;