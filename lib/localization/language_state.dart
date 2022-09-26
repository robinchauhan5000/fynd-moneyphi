part of 'language_cubit.dart';

class LanguageState extends Equatable {
  final Locale locale;

  LanguageState({required this.locale});

  factory LanguageState.initial() => LanguageState(locale: Locale('en', 'US'));

  LanguageState copyWith({Locale? locale}) =>
      LanguageState(locale: locale ?? this.locale);

  @override
  List<Object> get props => [locale];
}
