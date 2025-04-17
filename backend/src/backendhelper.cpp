#include <QDebug>
#include <QLocale>
#include <QDateTime>
#include "backendhelper.hpp"

BackendHelper::BackendHelper(QObject *po_parent)
    : QObject{po_parent}
    , _currentDay{ QString::number(QDateTime::currentDateTime().date().day()) }
    , _currentMonth{ QString::number(QDateTime::currentDateTime().date().month()) }
    , _currentYear{ QString::number(QDateTime::currentDateTime().date().year()) } {
    QLocale o_locale;
    _currentMonth = o_locale.monthName(_currentMonth.toInt());
    _currentDayName = o_locale.dayName(QDateTime::currentDateTime().date().dayOfWeek());
    _currentDayName.replace(0, 1, _currentDayName[0].toUpper());
}

QString BackendHelper::currentDayName() const {
    return _currentDayName;
}

void BackendHelper::setCurrentDayName(const QString &o_currentDayName) {
    if (_currentDayName == o_currentDayName)
        return;
    _currentDayName = o_currentDayName;
    emit currentDayNameChanged();
}

QString BackendHelper::currentDay() const {
    return _currentDay;
}

void BackendHelper::setCurrentDay(const QString &o_currentDay) {
    if (_currentDay == o_currentDay)
        return;
    _currentDay = o_currentDay;
    emit currentDayChanged();
}

QString BackendHelper::currentMonth() const {
    return _currentMonth;
}

void BackendHelper::setCurrentMonth(const QString &o_currentMonth) {
    if (_currentMonth == o_currentMonth)
        return;
    _currentMonth = o_currentMonth;
    emit currentMonthChanged();
}

QString BackendHelper::currentYear() const {
    return _currentYear;
}

void BackendHelper::setCurrentYear(const QString &o_currentYear) {
    if (_currentYear == o_currentYear)
        return;
    _currentYear = o_currentYear;
    emit currentYearChanged();
}
