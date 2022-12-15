#ifndef _ISTATE_H_2517689832025_
#define _ISTATE_H_2517689832025_

#include "itransition.h"

#include <QSharedPointer>

/*!
 * This is interface for work with automata, define states of automaton.
 * Note that transitions are added through IAutomaton only.
 */
class IState
{
public:
// types    
    typedef QSet<QString>                           TIStateNameSet;
    typedef QList<QString>                          TIStateNameList;
    typedef QList<QSharedPointer<IState> >          TIStateList;

    virtual ~IState() {}    

    //! Name has to be unique and VauCanSon-G compatible!!
    virtual void setName(const QString &name) = 0;
    virtual QString getName() const = 0;    

    //! Labels can be used multiple times for multiple states.
    virtual void setLabel(const QString &label) = 0;
    virtual QString getLabel() const = 0;

    virtual bool isInitial() const = 0;
    virtual bool isFinal() const = 0;

    virtual void setInitial(bool is = true) = 0;
    virtual void setFinal(bool is = true) = 0;
    
    virtual TIStateNameSet getStatesOn(const QString &character) const = 0;
    
    //! Useful for graph algorithms
    virtual TIStateNameList getAdjacentStates() const = 0;

    //! Returns transitions leading from state.
    virtual ITransition::TITransitionList getTransitions() const = 0;
    //! Returns transitions leading to state.
    virtual ITransition::TITransitionList getTransitionsTo() const = 0;
};

#endif //_ISTATE_H_2517689832025_
