#ifndef _IDRAWALGORITHM_H_687415313878_
#define _IDRAWALGORITHM_H_687415313878_

class QUndoCommand;
class Editor;
class IAutomaton;
class QPoint;

#include "iautomaton.h"
#include "state.h"
#include <QList>

class IDrawAlgorithm
{
public:
    virtual ~IDrawAlgorithm() {}

    //! Returns list of currently created states with transitions assigned, just use ItemsAddCommand on it
    //! \param startPos is left-top corner of result automaton
    virtual QList<State*> drawAutomaton(Editor *editor, const QSharedPointer<IAutomaton> &automaton) = 0;

    virtual QString getName() const = 0;
};

#endif
