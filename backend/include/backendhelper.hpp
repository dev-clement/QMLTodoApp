#ifndef BACKENDHELPER_HPP
#define BACKENDHELPER_HPP

#include <QString>
#include <QObject>
#include <QQmlEngine>

class BackendHelper : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON
public:
    explicit BackendHelper(QObject *parent = nullptr);

    Q_PROPERTY(QString currentDay READ currentDay WRITE setCurrentDay NOTIFY currentDayChanged FINAL)
    Q_PROPERTY(QString currentMonth READ currentMonth WRITE setCurrentMonth NOTIFY currentMonthChanged FINAL)
    Q_PROPERTY(QString currentYear READ currentYear WRITE setCurrentYear NOTIFY currentYearChanged FINAL)
    Q_PROPERTY(QString currentDayName READ currentDayName WRITE setCurrentDayName NOTIFY currentDayNameChanged FINAL)

    QString currentDay() const;
    void setCurrentDay(const QString &newCurrentDay);

    QString currentMonth() const;
    void setCurrentMonth(const QString &newCurrentMonth);

    QString currentYear() const;
    void setCurrentYear(const QString &newCurrentYear);

    QString currentDayName() const;
    void setCurrentDayName(const QString &newCurrentDayName);
signals:
    void currentDayChanged();
    void currentMonthChanged();
    void currentYearChanged();
    void currentDayNameChanged();
private:
    QString _currentDay;
    QString _currentMonth;
    QString _currentYear;
    QString _currentDayName;
};

#endif // BACKENDHELPER_HPP
