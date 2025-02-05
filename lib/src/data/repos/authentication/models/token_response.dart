class TokensResponse {
  final String? accessToken;
  final String? refreshToken;

  TokensResponse({this.accessToken, this.refreshToken});

  factory TokensResponse.fromJson(Map<String, dynamic> json) {
    return TokensResponse(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }
}
