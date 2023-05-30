class Headers {
  calls(headers) {
    final clear = _headersClear(headers);
    final removed = _removeKeys(clear);
    return removed;
  }

  _headersClear(headers) {
    final Map<String, dynamic> headerValues = {};
    headers.forEach((name, values) {
      headerValues[name] = values;
    });
    return headerValues;
  }

  _removeKeys(headers) {
    headers.remove('user-agent');
    headers.remove('connection');
    headers.remove('accept');
    headers.remove('accept-encoding');
    headers.remove('postman-token');
    headers.remove('content-length');
    headers.remove('host');
    headers.remove('content-type');
    return headers;
  }
}
