part of 'onboarding_cubit.dart';

@immutable
abstract class OnboardingState {}

class OnboardingInitial extends OnboardingState {}

class OnboardingNotComplete extends OnboardingState {}

class OnboardingComplete extends OnboardingState {}
