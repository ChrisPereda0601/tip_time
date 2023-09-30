import 'package:flutter/material.dart';

enum ServiceQuality { amazing, good, okay }

class TipTimeProvider extends ChangeNotifier {
  double _costo = 0;
  double _monto_propina = 0;
  ServiceQuality _serviceQuality = ServiceQuality.amazing;
  bool _isSelected = false;

  double get getMonto => _monto_propina;
  ServiceQuality get getServiceQuality => _serviceQuality;
  bool get getIsSelected => _isSelected;

  void agregarCosto(String costo) {
    final double? parsedCosto = double.tryParse(costo);
    if (parsedCosto != null) {
      _costo = parsedCosto;
      notifyListeners();
    }
  }

  void setServiceQuality(ServiceQuality quality) {
    _serviceQuality = quality;
    notifyListeners();
  }

  void botonSwitch(bool newValue) {
    _isSelected = newValue;
    notifyListeners();
  }

  void calcularMonto() {
    if (_isSelected) {
      if (_serviceQuality == ServiceQuality.amazing) {
        _monto_propina = (_costo * 0.20).ceilToDouble();
      } else if (_serviceQuality == ServiceQuality.good) {
        _monto_propina = (_costo * 0.18).ceilToDouble();
      } else if (_serviceQuality == ServiceQuality.okay) {
        _monto_propina = (_costo * 0.15).ceilToDouble();
      }
    } else {
      if (_serviceQuality == ServiceQuality.amazing) {
        _monto_propina = _costo * 0.20;
      } else if (_serviceQuality == ServiceQuality.good) {
        _monto_propina = _costo * 0.18;
      } else if (_serviceQuality == ServiceQuality.okay) {
        _monto_propina = _costo * 0.15;
      }
    }

    notifyListeners();
  }
}
