#ifndef _UTILS_H_24363650851_
#define _UTILS_H_24363650851_

#include <QString>
#include <QStringList>
#include <QRegExp>

// declarations -------------------------------->

//! makes string in form "abc" from stringlist ["a","b","c"]
QString trStringListToString(const QStringList &strings);

//! appends suffix if needed, otherwise return false
bool appendFilenameSuffix(QString &fileName, const QString &suffix);

//! converts list of SharedPointers to subtype to list of SharedPointers to supertype 
//! (TO has to be child of FROM)
template <typename FROM, typename TO>
QList<QSharedPointer<TO> > trSharedPointerListStaticCast(const QList<QSharedPointer<FROM> > &list);

//! make list's items unique
template <typename T>
QList<T> getUnifiedListKeepOrder(const QList<T> &list);

// definitions --------------------------------->

inline QString trStringListToString(const QStringList &strings)
{
    return strings.join("");
}

inline bool appendFilenameSuffix(QString &fileName, const QString &suffix)
{
    if (fileName.lastIndexOf(".") != -1)
    {
        return false;
    }
    
    fileName.append(".").append(suffix);
    return true;
}

template <typename FROM, typename TO>
QList<QSharedPointer<TO> > trSharedPointerListStaticCast(const QList<QSharedPointer<FROM> > &list)
{
    typedef QList<QSharedPointer<FROM> >    TInputList;
    typedef QList<QSharedPointer<TO> >      TOutputList;
    
    TOutputList result;
    for (typename TInputList::ConstIterator listIt = list.begin();
         listIt != list.end();
         ++listIt)
    {
        result << (*listIt);
    }
    
    return result;
}

template <typename T>
QList<T> getUnifiedListKeepOrder(const QList<T> &list)
{
    QList<T>    unifiedList;
    QSet<T>     itemsSet;
    
    for(typename QList<T>::ConstIterator listIt = list.begin();
        listIt != list.end();
        ++listIt)
    {
        if (itemsSet.contains(*listIt)) continue;
        unifiedList << *listIt;
        itemsSet << *listIt;
    }
    
    return unifiedList;
}

#endif //_STRINGLISTTOSTRING_H_24363650851_
