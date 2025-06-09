/// Simple country handler for product management
/// Handles country fallbacks for different regions
class CountryHandler {
  // Your supported countries
  static const List<String> _supportedCountries = [
    'US', 'DE', 'ES', 'IT', 'FR'
  ];

  /// Get fallback country based on region
  static String getFallbackCountry(String countryCode) {
    final code = countryCode.toUpperCase();
    
    // If already supported, return as is
    if (_supportedCountries.contains(code)) {
      return code;
    }

    // European countries fallback to Germany, France, Spain, or Italy
    final Map<String, String> europeanFallbacks = {
      'AT': 'DE', // Austria -> Germany
      'CH': 'DE', // Switzerland -> Germany
      'NL': 'DE', // Netherlands -> Germany
      'BE': 'FR', // Belgium -> France
      'LU': 'FR', // Luxembourg -> France
      'PT': 'ES', // Portugal -> Spain
      'GR': 'IT', // Greece -> Italy
      'CY': 'IT', // Cyprus -> Italy
      'MT': 'IT', // Malta -> Italy
      'GB': 'FR', // UK -> France
      'IE': 'FR', // Ireland -> France
      'IS': 'DE', // Iceland -> Germany
      'NO': 'DE', // Norway -> Germany
      'SE': 'DE', // Sweden -> Germany
      'DK': 'DE', // Denmark -> Germany
      'FI': 'DE', // Finland -> Germany
      'PL': 'DE', // Poland -> Germany
      'CZ': 'DE', // Czech Republic -> Germany
      'SK': 'DE', // Slovakia -> Germany
      'HU': 'DE', // Hungary -> Germany
      'SI': 'DE', // Slovenia -> Germany
      'HR': 'DE', // Croatia -> Germany
      'RO': 'DE', // Romania -> Germany
      'BG': 'DE', // Bulgaria -> Germany
    };

    // Other regions fallback to US
    final Map<String, String> otherFallbacks = {
      'CA': 'US', // Canada -> US
      'MX': 'US', // Mexico -> US
      'BR': 'US', // Brazil -> US
      'AR': 'US', // Argentina -> US
      'AU': 'US', // Australia -> US
      'NZ': 'US', // New Zealand -> US
      'SG': 'US', // Singapore -> US
      'HK': 'US', // Hong Kong -> US
      'TW': 'US', // Taiwan -> US
      'KR': 'US', // South Korea -> US
      'IN': 'US', // India -> US
      'JP': 'US', // Japan -> US
    };

    // Check European fallbacks first
    if (europeanFallbacks.containsKey(code)) {
      return europeanFallbacks[code]!;
    }

    // Check other fallbacks
    if (otherFallbacks.containsKey(code)) {
      return otherFallbacks[code]!;
    }

    // Default fallback to Germany for Europe, US for others
    return _isEuropeanCountry(code) ? 'DE' : 'US';
  }

  /// Check if country is European
  static bool _isEuropeanCountry(String countryCode) {
    const europeanCountries = [
      'AD', 'AL', 'AM', 'AT', 'AZ', 'BA', 'BE', 'BG', 'BY', 'CH', 'CY', 'CZ',
      'DE', 'DK', 'EE', 'ES', 'FI', 'FR', 'GB', 'GE', 'GR', 'HR', 'HU', 'IE',
      'IS', 'IT', 'LI', 'LT', 'LU', 'LV', 'MC', 'MD', 'ME', 'MK', 'MT', 'NL',
      'NO', 'PL', 'PT', 'RO', 'RS', 'RU', 'SE', 'SI', 'SK', 'SM', 'TR', 'UA',
      'VA', 'XK'
    ];
    return europeanCountries.contains(countryCode.toUpperCase());
  }

  /// Check if country has direct support
  static bool isSupported(String countryCode) {
    return _supportedCountries.contains(countryCode.toUpperCase());
  }

  /// Get all supported countries
  static List<String> getSupportedCountries() {
    return List.from(_supportedCountries);
  }
}

/// Simple location service
class LocationService {
  static String? _currentCountry;

  /// Set current country
  static void setCountry(String countryCode) {
    _currentCountry = CountryHandler.getFallbackCountry(countryCode);
  }

  /// Get current country
  static String getCurrentCountry() {
    return _currentCountry ?? 'US';
  }

  /// Check if current country is supported
  static bool isCurrentCountrySupported() {
    return CountryHandler.isSupported(getCurrentCountry());
  }
}