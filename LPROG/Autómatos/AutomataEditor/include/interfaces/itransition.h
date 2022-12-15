#ifndef _ITRANSITION_H_414798923403_
#define _ITRANSITION_H_414798923403_

#include <QSet>
#include <QChar>

#include <QSharedPointer>

/*!
 * This is interface for work with automata, defines transitions defined in automaton.
 */
class ITransition
{
public:
//types
    typedef QSet<QString>                           TCharSet;           //!< QString due to something as \\varepsilon{}, \\gamma{}, etc.
    typedef QSet<QSharedPointer<ITransition> >      TITransitionSet;
    typedef QList<QSharedPointer<ITransition> >     TITransitionList;

    virtual ~ITransition() {}

    virtual void setSourceState(const QString &stateName) = 0;
    virtual void setDestinationState(const QString &stateName) = 0;

    virtual QString getSourceState() const = 0;
    virtual QString getDestinationState() const = 0;    

    virtual bool passOn(const QString &character) const = 0;    

    //! Returns characters on which transitions passes
    virtual TCharSet getCharacters() const = 0;
};

#endif //_ITRANSITION_H_414798923403_
