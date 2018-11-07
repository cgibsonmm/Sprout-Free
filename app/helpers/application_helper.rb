module ApplicationHelper
  def forum_area?
    controllers = %w[forums forum_categories forum_threads forum_topics forum_posts]
    controllers.include?(controller_name)
  end

  def root_controller?
    controller_name == 'home'
  end

  def admin?
    current_user.admin == true
  end

  def user_admin?
    user_signed_in? && current_user.has_role?(:admin)
  end

  def peace_icon
    '<img src="data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIj8+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiBoZWlnaHQ9IjI0cHgiIHZlcnNpb249IjEuMSIgdmlld0JveD0iLTc0IDEgNTExIDUxMS45OTg5NyIgd2lkdGg9IjI0cHgiPgo8ZyBpZD0ic3VyZmFjZTEiPgo8cGF0aCBkPSJNIDM2Mi43ODkwNjIgMjkxLjEyODkwNiBDIDM2Mi43OTI5NjkgMjkwLjk4MDQ2OSAzNjIuNzk2ODc1IDI5MC44MzU5MzggMzYyLjc5Njg3NSAyOTAuNjg3NSBDIDM2Mi43OTY4NzUgMjYwLjI2OTUzMSAzMzguMDQ2ODc1IDIzNS41MTk1MzEgMzA3LjYyNSAyMzUuNTE5NTMxIEwgMjkyLjU2NjQwNiAyMzUuNTE5NTMxIEwgMzU4LjU4OTg0NCA3Ni4yODEyNSBDIDM3MC4yMjY1NjIgNDguMTgzNTk0IDM1Ni44MzU5MzggMTUuODQ3NjU2IDMyOC43MzQzNzUgNC4xOTkyMTkgQyAzMDAuNjI4OTA2IC03LjQ0MTQwNiAyNjguMjkyOTY5IDUuOTUzMTI1IDI1Ni42NTIzNDQgMzQuMDU4NTk0IEwgMjE1LjM5MDYyNSAxMzMuNjY3OTY5IEwgMTc0LjEzMjgxMiAzNC4wNTQ2ODggQyAxNjIuNDg4MjgxIDUuOTUzMTI1IDEzMC4xNTIzNDQgLTcuNDQxNDA2IDEwMi4wNTA3ODEgNC4xOTkyMTkgQyA3My45NDkyMTkgMTUuODQzNzUgNjAuNTU0Njg4IDQ4LjE3NTc4MSA3Mi4xOTUzMTIgNzYuMjc3MzQ0IEwgMTA4LjAzOTA2MiAxNjIuODE2NDA2IEMgMTAzLjUxNTYyNSAxNjUuNDg4MjgxIDk5LjQxMDE1NiAxNjguNzg1MTU2IDk1LjgzMjAzMSAxNzIuNTg5ODQ0IEMgODUuNzYxNzE5IDE2MS44ODY3MTkgNzEuNDg4MjgxIDE1NS4xNzk2ODggNTUuNjY3OTY5IDE1NS4xNzU3ODEgQyAyNS4yNDYwOTQgMTU1LjE3NTc4MSAwLjUgMTc5LjkyNTc4MSAwLjUgMjEwLjM0NzY1NiBMIDAuNSAzMzAuODUxNTYyIEMgMC41IDQzMC43MzgyODEgODEuNzYxNzE5IDUxMiAxODEuNjQ4NDM4IDUxMiBDIDI4MS41MzEyNSA1MTIgMzYyLjc5Mjk2OSA0MzAuNzM4MjgxIDM2Mi43OTI5NjkgMzMwLjg1MTU2MiBaIE0gMTEzLjUzNTE1NiAzMS45MTc5NjkgQyAxMjYuMzUxNTYyIDI2LjYwNTQ2OSAxNDEuMTAxNTYyIDMyLjcxODc1IDE0Ni40MTQwNjIgNDUuNTM5MDYyIEwgMjAxLjUzMTI1IDE3OC42MDU0NjkgQyAyMDMuODU1NDY5IDE4NC4yMTA5MzggMjA5LjMyNDIxOSAxODcuODY3MTg4IDIxNS4zOTA2MjUgMTg3Ljg2NzE4OCBDIDIyMS40NTcwMzEgMTg3Ljg2NzE4OCAyMjYuOTI1NzgxIDE4NC4yMTA5MzggMjI5LjI1IDE3OC42MDU0NjkgTCAyODQuMzY3MTg4IDQ1LjUzOTA2MiBDIDI4OS42Nzk2ODggMzIuNzE4NzUgMzA0LjQyOTY4OCAyNi42MDU0NjkgMzE3LjI1IDMxLjkxNDA2MiBDIDMzMC4wNzAzMTIgMzcuMjMwNDY5IDMzNi4xNzk2ODggNTEuOTgwNDY5IDMzMC44NzEwOTQgNjQuNzk2ODc1IEwgMjYwLjA4NTkzOCAyMzUuNTE5NTMxIEwgMTkxLjE2Nzk2OSAyMzUuNTE5NTMxIEwgMTkxLjE3MTg3NSAyMTAuMzQ3NjU2IEMgMTkxLjE2Nzk2OSAxODAuMzg2NzE5IDE2Ny4xNTIzNDQgMTU1Ljk0NTMxMiAxMzcuMzYzMjgxIDE1NS4yMTA5MzggTCA5OS45MTQwNjIgNjQuODAwNzgxIEMgOTQuNjAxNTYyIDUxLjk4MDQ2OSAxMDAuNzE0ODQ0IDM3LjIzMDQ2OSAxMTMuNTM1MTU2IDMxLjkxNzk2OSBaIE0gMTM2IDIzNS41MTk1MzEgQyAxMjYuOTM3NSAyMzUuNTE5NTMxIDExOC4zODY3MTkgMjM3LjczMDQ2OSAxMTAuODM1OTM4IDI0MS42MjEwOTQgTCAxMTAuODM1OTM4IDIxMC4zNDc2NTYgQyAxMTAuODM1OTM4IDE5Ni40Njg3NSAxMjIuMTI1IDE4NS4xNzk2ODggMTM2IDE4NS4xNzk2ODggQyAxNDkuODc4OTA2IDE4NS4xNzk2ODggMTYxLjE2Nzk2OSAxOTYuNDcyNjU2IDE2MS4xNzE4NzUgMjEwLjM0NzY1NiBMIDE2MS4xNjc5NjkgMjM1LjUxOTUzMSBaIE0gMzAuNSAyMTAuMzQ3NjU2IEMgMzAuNSAxOTYuNDY4NzUgNDEuNzg5MDYyIDE4NS4xNzU3ODEgNTUuNjY0MDYyIDE4NS4xNzU3ODEgQyA2OS41NDI5NjkgMTg1LjE3OTY4OCA4MC44MzIwMzEgMTk2LjQ3MjY1NiA4MC44MzU5MzggMjEwLjM0NzY1NiBMIDgwLjgzNTkzOCAyOTAuNjgzNTk0IEMgODAuODMyMDMxIDMwNC41NTg1OTQgNjkuNTQyOTY5IDMxNS44NDc2NTYgNTUuNjY3OTY5IDMxNS44NDc2NTYgQyA0MS43OTI5NjkgMzE1Ljg0NzY1NiAzMC41IDMwNC41NTg1OTQgMzAuNSAyOTAuNjgzNTk0IFogTSAxODEuNjQ4NDM4IDQ4MiBDIDEwMS4zNDM3NSA0ODIgMzUuNDcyNjU2IDQxOS4wNDI5NjkgMzAuNzgxMjUgMzM5Ljg5NDUzMSBDIDM4LjI2MTcxOSAzNDMuNjkxNDA2IDQ2LjcxNDg0NCAzNDUuODUxNTYyIDU1LjY2Nzk2OSAzNDUuODUxNTYyIEMgNzEuNDg4MjgxIDM0NS44NTE1NjIgODUuNzY1NjI1IDMzOS4xNDQ1MzEgOTUuODM1OTM4IDMyOC40Mzc1IEMgMTA1LjkwNjI1IDMzOS4xNDQ1MzEgMTIwLjE3OTY4OCAzNDUuODUxNTYyIDEzNi4wMDM5MDYgMzQ1Ljg1MTU2MiBMIDI2Ny40NTcwMzEgMzQ1Ljg1MTU2MiBDIDI3NS43NDIxODggMzQ1Ljg1MTU2MiAyODIuNDU3MDMxIDMzOS4xMzY3MTkgMjgyLjQ1NzAzMSAzMzAuODUxNTYyIEMgMjgyLjQ1NzAzMSAzMjIuNTcwMzEyIDI3NS43NDIxODggMzE1Ljg1MTU2MiAyNjcuNDU3MDMxIDMxNS44NTE1NjIgTCAxMzYuMDAzOTA2IDMxNS44NTE1NjIgQyAxMjIuMTI4OTA2IDMxNS44NTE1NjIgMTEwLjgzNTkzOCAzMDQuNTU4NTk0IDExMC44MzU5MzggMjkwLjY4MzU5NCBDIDExMC44Mzk4NDQgMjc2LjgwODU5NCAxMjIuMTI4OTA2IDI2NS41MTk1MzEgMTM2LjAwMzkwNiAyNjUuNTE5NTMxIEwgMTc2LjE2NDA2MiAyNjUuNTE5NTMxIEMgMTc2LjE2Nzk2OSAyNjUuNTE5NTMxIDE3Ni4xNjc5NjkgMjY1LjUxOTUzMSAxNzYuMTY3OTY5IDI2NS41MTk1MzEgTCAxNzYuMTcxODc1IDI2NS41MTk1MzEgQyAxNzYuMTcxODc1IDI2NS41MTk1MzEgMTc2LjE3MTg3NSAyNjUuNTE5NTMxIDE3Ni4xNzU3ODEgMjY1LjUxOTUzMSBMIDI3MC4wMjczNDQgMjY1LjUxOTUzMSBDIDI3MC4wNTA3ODEgMjY1LjUxOTUzMSAyNzAuMDc4MTI1IDI2NS41MjM0MzggMjcwLjEwMTU2MiAyNjUuNTIzNDM4IEMgMjcwLjEzNjcxOSAyNjUuNTIzNDM4IDI3MC4xNjc5NjkgMjY1LjUxOTUzMSAyNzAuMjAzMTI1IDI2NS41MTk1MzEgTCAzMDcuNjI1IDI2NS41MTk1MzEgQyAzMjEuNDQ5MjE5IDI2NS41MTk1MzEgMzMyLjcwMzEyNSAyNzYuNzE0ODQ0IDMzMi43OTY4NzUgMjkwLjUxNTYyNSBDIDMzMi43OTI5NjkgMjkwLjY1MjM0NCAzMzIuNzkyOTY5IDI5MC43OTI5NjkgMzMyLjc5Mjk2OSAyOTAuOTMzNTk0IEwgMzMyLjc5Mjk2OSAzMzAuODUxNTYyIEMgMzMyLjc5Mjk2OSA0MTQuMTk1MzEyIDI2NC45ODgyODEgNDgyIDE4MS42NDg0MzggNDgyIFogTSAxODEuNjQ4NDM4IDQ4MiAiIHN0eWxlPSIgZmlsbC1ydWxlOm5vbnplcm87ZmlsbC1vcGFjaXR5OjE7IiBzdHJva2U9IiMwMDZERjAiIGZpbGw9IiMwMDZERjAiLz4KPC9nPgo8L3N2Zz4K" />'
  end

  def peace_icon_white
    '<img src="data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIj8+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiBoZWlnaHQ9IjE2cHgiIHZlcnNpb249IjEuMSIgdmlld0JveD0iLTc0IDEgNTExIDUxMS45OTg5NyIgd2lkdGg9IjE2cHgiPgo8ZyBpZD0ic3VyZmFjZTEiPgo8cGF0aCBkPSJNIDM2Mi43ODkwNjIgMjkxLjEyODkwNiBDIDM2Mi43OTI5NjkgMjkwLjk4MDQ2OSAzNjIuNzk2ODc1IDI5MC44MzU5MzggMzYyLjc5Njg3NSAyOTAuNjg3NSBDIDM2Mi43OTY4NzUgMjYwLjI2OTUzMSAzMzguMDQ2ODc1IDIzNS41MTk1MzEgMzA3LjYyNSAyMzUuNTE5NTMxIEwgMjkyLjU2NjQwNiAyMzUuNTE5NTMxIEwgMzU4LjU4OTg0NCA3Ni4yODEyNSBDIDM3MC4yMjY1NjIgNDguMTgzNTk0IDM1Ni44MzU5MzggMTUuODQ3NjU2IDMyOC43MzQzNzUgNC4xOTkyMTkgQyAzMDAuNjI4OTA2IC03LjQ0MTQwNiAyNjguMjkyOTY5IDUuOTUzMTI1IDI1Ni42NTIzNDQgMzQuMDU4NTk0IEwgMjE1LjM5MDYyNSAxMzMuNjY3OTY5IEwgMTc0LjEzMjgxMiAzNC4wNTQ2ODggQyAxNjIuNDg4MjgxIDUuOTUzMTI1IDEzMC4xNTIzNDQgLTcuNDQxNDA2IDEwMi4wNTA3ODEgNC4xOTkyMTkgQyA3My45NDkyMTkgMTUuODQzNzUgNjAuNTU0Njg4IDQ4LjE3NTc4MSA3Mi4xOTUzMTIgNzYuMjc3MzQ0IEwgMTA4LjAzOTA2MiAxNjIuODE2NDA2IEMgMTAzLjUxNTYyNSAxNjUuNDg4MjgxIDk5LjQxMDE1NiAxNjguNzg1MTU2IDk1LjgzMjAzMSAxNzIuNTg5ODQ0IEMgODUuNzYxNzE5IDE2MS44ODY3MTkgNzEuNDg4MjgxIDE1NS4xNzk2ODggNTUuNjY3OTY5IDE1NS4xNzU3ODEgQyAyNS4yNDYwOTQgMTU1LjE3NTc4MSAwLjUgMTc5LjkyNTc4MSAwLjUgMjEwLjM0NzY1NiBMIDAuNSAzMzAuODUxNTYyIEMgMC41IDQzMC43MzgyODEgODEuNzYxNzE5IDUxMiAxODEuNjQ4NDM4IDUxMiBDIDI4MS41MzEyNSA1MTIgMzYyLjc5Mjk2OSA0MzAuNzM4MjgxIDM2Mi43OTI5NjkgMzMwLjg1MTU2MiBaIE0gMTEzLjUzNTE1NiAzMS45MTc5NjkgQyAxMjYuMzUxNTYyIDI2LjYwNTQ2OSAxNDEuMTAxNTYyIDMyLjcxODc1IDE0Ni40MTQwNjIgNDUuNTM5MDYyIEwgMjAxLjUzMTI1IDE3OC42MDU0NjkgQyAyMDMuODU1NDY5IDE4NC4yMTA5MzggMjA5LjMyNDIxOSAxODcuODY3MTg4IDIxNS4zOTA2MjUgMTg3Ljg2NzE4OCBDIDIyMS40NTcwMzEgMTg3Ljg2NzE4OCAyMjYuOTI1NzgxIDE4NC4yMTA5MzggMjI5LjI1IDE3OC42MDU0NjkgTCAyODQuMzY3MTg4IDQ1LjUzOTA2MiBDIDI4OS42Nzk2ODggMzIuNzE4NzUgMzA0LjQyOTY4OCAyNi42MDU0NjkgMzE3LjI1IDMxLjkxNDA2MiBDIDMzMC4wNzAzMTIgMzcuMjMwNDY5IDMzNi4xNzk2ODggNTEuOTgwNDY5IDMzMC44NzEwOTQgNjQuNzk2ODc1IEwgMjYwLjA4NTkzOCAyMzUuNTE5NTMxIEwgMTkxLjE2Nzk2OSAyMzUuNTE5NTMxIEwgMTkxLjE3MTg3NSAyMTAuMzQ3NjU2IEMgMTkxLjE2Nzk2OSAxODAuMzg2NzE5IDE2Ny4xNTIzNDQgMTU1Ljk0NTMxMiAxMzcuMzYzMjgxIDE1NS4yMTA5MzggTCA5OS45MTQwNjIgNjQuODAwNzgxIEMgOTQuNjAxNTYyIDUxLjk4MDQ2OSAxMDAuNzE0ODQ0IDM3LjIzMDQ2OSAxMTMuNTM1MTU2IDMxLjkxNzk2OSBaIE0gMTM2IDIzNS41MTk1MzEgQyAxMjYuOTM3NSAyMzUuNTE5NTMxIDExOC4zODY3MTkgMjM3LjczMDQ2OSAxMTAuODM1OTM4IDI0MS42MjEwOTQgTCAxMTAuODM1OTM4IDIxMC4zNDc2NTYgQyAxMTAuODM1OTM4IDE5Ni40Njg3NSAxMjIuMTI1IDE4NS4xNzk2ODggMTM2IDE4NS4xNzk2ODggQyAxNDkuODc4OTA2IDE4NS4xNzk2ODggMTYxLjE2Nzk2OSAxOTYuNDcyNjU2IDE2MS4xNzE4NzUgMjEwLjM0NzY1NiBMIDE2MS4xNjc5NjkgMjM1LjUxOTUzMSBaIE0gMzAuNSAyMTAuMzQ3NjU2IEMgMzAuNSAxOTYuNDY4NzUgNDEuNzg5MDYyIDE4NS4xNzU3ODEgNTUuNjY0MDYyIDE4NS4xNzU3ODEgQyA2OS41NDI5NjkgMTg1LjE3OTY4OCA4MC44MzIwMzEgMTk2LjQ3MjY1NiA4MC44MzU5MzggMjEwLjM0NzY1NiBMIDgwLjgzNTkzOCAyOTAuNjgzNTk0IEMgODAuODMyMDMxIDMwNC41NTg1OTQgNjkuNTQyOTY5IDMxNS44NDc2NTYgNTUuNjY3OTY5IDMxNS44NDc2NTYgQyA0MS43OTI5NjkgMzE1Ljg0NzY1NiAzMC41IDMwNC41NTg1OTQgMzAuNSAyOTAuNjgzNTk0IFogTSAxODEuNjQ4NDM4IDQ4MiBDIDEwMS4zNDM3NSA0ODIgMzUuNDcyNjU2IDQxOS4wNDI5NjkgMzAuNzgxMjUgMzM5Ljg5NDUzMSBDIDM4LjI2MTcxOSAzNDMuNjkxNDA2IDQ2LjcxNDg0NCAzNDUuODUxNTYyIDU1LjY2Nzk2OSAzNDUuODUxNTYyIEMgNzEuNDg4MjgxIDM0NS44NTE1NjIgODUuNzY1NjI1IDMzOS4xNDQ1MzEgOTUuODM1OTM4IDMyOC40Mzc1IEMgMTA1LjkwNjI1IDMzOS4xNDQ1MzEgMTIwLjE3OTY4OCAzNDUuODUxNTYyIDEzNi4wMDM5MDYgMzQ1Ljg1MTU2MiBMIDI2Ny40NTcwMzEgMzQ1Ljg1MTU2MiBDIDI3NS43NDIxODggMzQ1Ljg1MTU2MiAyODIuNDU3MDMxIDMzOS4xMzY3MTkgMjgyLjQ1NzAzMSAzMzAuODUxNTYyIEMgMjgyLjQ1NzAzMSAzMjIuNTcwMzEyIDI3NS43NDIxODggMzE1Ljg1MTU2MiAyNjcuNDU3MDMxIDMxNS44NTE1NjIgTCAxMzYuMDAzOTA2IDMxNS44NTE1NjIgQyAxMjIuMTI4OTA2IDMxNS44NTE1NjIgMTEwLjgzNTkzOCAzMDQuNTU4NTk0IDExMC44MzU5MzggMjkwLjY4MzU5NCBDIDExMC44Mzk4NDQgMjc2LjgwODU5NCAxMjIuMTI4OTA2IDI2NS41MTk1MzEgMTM2LjAwMzkwNiAyNjUuNTE5NTMxIEwgMTc2LjE2NDA2MiAyNjUuNTE5NTMxIEMgMTc2LjE2Nzk2OSAyNjUuNTE5NTMxIDE3Ni4xNjc5NjkgMjY1LjUxOTUzMSAxNzYuMTY3OTY5IDI2NS41MTk1MzEgTCAxNzYuMTcxODc1IDI2NS41MTk1MzEgQyAxNzYuMTcxODc1IDI2NS41MTk1MzEgMTc2LjE3MTg3NSAyNjUuNTE5NTMxIDE3Ni4xNzU3ODEgMjY1LjUxOTUzMSBMIDI3MC4wMjczNDQgMjY1LjUxOTUzMSBDIDI3MC4wNTA3ODEgMjY1LjUxOTUzMSAyNzAuMDc4MTI1IDI2NS41MjM0MzggMjcwLjEwMTU2MiAyNjUuNTIzNDM4IEMgMjcwLjEzNjcxOSAyNjUuNTIzNDM4IDI3MC4xNjc5NjkgMjY1LjUxOTUzMSAyNzAuMjAzMTI1IDI2NS41MTk1MzEgTCAzMDcuNjI1IDI2NS41MTk1MzEgQyAzMjEuNDQ5MjE5IDI2NS41MTk1MzEgMzMyLjcwMzEyNSAyNzYuNzE0ODQ0IDMzMi43OTY4NzUgMjkwLjUxNTYyNSBDIDMzMi43OTI5NjkgMjkwLjY1MjM0NCAzMzIuNzkyOTY5IDI5MC43OTI5NjkgMzMyLjc5Mjk2OSAyOTAuOTMzNTk0IEwgMzMyLjc5Mjk2OSAzMzAuODUxNTYyIEMgMzMyLjc5Mjk2OSA0MTQuMTk1MzEyIDI2NC45ODgyODEgNDgyIDE4MS42NDg0MzggNDgyIFogTSAxODEuNjQ4NDM4IDQ4MiAiIHN0eWxlPSIgZmlsbC1ydWxlOm5vbnplcm87ZmlsbC1vcGFjaXR5OjE7IiBzdHJva2U9IiNGRkZGRkYiIGZpbGw9IiNGRkZGRkYiLz4KPC9nPgo8L3N2Zz4K" />'
  end
end
