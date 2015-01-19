trimUrl = (url, length = 60, separator = '…') ->
    url = url.replace /^https?:\/\/(?:www\.)?/, ''

    return url if not url?
    return url if length >= url.length

    parts = []
    path = url.indexOf '/'
    str = ['','']

    while path > 0
        parts.push path
        path = url.indexOf '/', path + 1

    parts.pop() if url.charAt(url.length - 1) is '/'

    return url if parts.length <= 1

    str[1] = url.slice parts.pop()
    str[0] = url.slice 0, parts.pop() + 1

    while str.join('').length > length and parts.length > 1
        str[0] = url.slice 0, parts.pop() + 1

    return str.join separator