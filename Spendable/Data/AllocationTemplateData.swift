//
//  AllocationTemplateData.swift
//  Spendable
//
//  Created by Michael St Clair on 2/2/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI
import Combine

extension UserData  {
    func loadAllocationTemplates() {
        apollo.client.fetch(query: ListAllocationTemplatesQuery()) { result in
            guard let data = try? result.get().data else { return }
            self.load(data: data)
        }
    }
    
    func load(data: ListAllocationTemplatesQuery.Data) {
        var templatesFromData: [AllocationTemplate] = []
        
        for templateData in data.allocationTemplates ?? [] {
            if let id = templateData?.id, let name = templateData?.name {
                let lines = templateData?.lines?.map { line in
                    return AllocationTemplateLine(id: line!.id!, amount: line!.amount!, budgetId: line!.budget!.id!)
                }
                
                let template = AllocationTemplate(id: id, name: name, lines: lines ?? [])
                templatesFromData.append(template)
            }
        }
        
        allocationTemplates = templatesFromData
    }
    
    func create(template: AllocationTemplate) {
        let inputLines = template.lines.map { line in
            return AllocationTemplateLineInputObject(
                amount: line.amount,
                budgetId: line.budgetId
            )
        }
        
        let mutation = CreateAllocationTemplateMutation(name: template.name, lines: inputLines)
        
        apollo.client.perform(mutation: mutation) { result in
            guard let data = try? result.get().data?.createAllocationTemplate else { return }
            
            let lines = data.lines?.map { line in
                return AllocationTemplateLine(id: line!.id!, amount: line!.amount!, budgetId: line!.budget!.id!)
            }
            
            template.id = data.id!
            template.lines = lines ?? []
            
            self.allocationTemplates.append(template)
            self.apollo.client.clearCache()
        }
    }
    
    func update(template: AllocationTemplate) {
        let inputLines = template.lines.map { line in
            return AllocationTemplateLineInputObject(
                amount: line.amount,
                budgetId: line.budgetId,
                id: line.id.hasPrefix("temp-") ? nil : line.id
            )
        }
        
        let mutation = UpdateAllocationTemplateMutation(id: template.id, name: template.name, lines: inputLines)
        
        apollo.client.perform(mutation: mutation) { result in
            guard let data = try? result.get().data?.updateAllocationTemplate else { return }
            
            let lines = data.lines?.map { line in
                return AllocationTemplateLine(id: line!.id!, amount: line!.amount!, budgetId: line!.budget!.id!)
            }
            
            template.lines = lines ?? []
            
            self.apollo.client.clearCache()
        }
    }
    
    func deleteAllocationTemplates(at offsets: IndexSet) {
        for offset in Array(offsets) {
            apollo.client.perform(mutation: DeleteAllocationTemplateMutation(id: allocationTemplates[offset].id))
        }
        
        allocationTemplates.remove(atOffsets: offsets)
        self.apollo.client.clearCache()
    }
}
